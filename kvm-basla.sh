#!/bin/bash
OSK="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VMDIR=$PWD
OVMF=$VMDIR/firmware

export QEMU_AUDIO_DRV=alsa
export QEMU_PA_SINK=alsa_output.pci-0000_04_01.0.analog-stereo.monitor
export QEMU_PA_SOURCE=input

SYSTEM_DISK="MyDisk.qcow2"

[[ -z "$MEM" ]] && {
    MEM="25G"
}

[[ -z "$CPUS" ]] && {
	CPUS="3"
}

[[ -z "$CORE" ]] && {
	cores="2"
}

[[ -z "$VGAMEM" ]] && {
	vgamem_mb="64"
}

[[ -z "$SYSTEM_DISK" ]] && {
    echo "SYSTEM_DISK belirleyiniz"
    exit 1
}

[[ -r "$SYSTEM_DISK" ]] || {
    echo "Sistem Disk Okunamıyor: $SYSTEM_DISK"
    exit 1
}

MOREARGS=()

[[ "$HEADLESS" = "1" ]] && {
    MOREARGS+=(-nographic -vnc ::0 -k tr-TR)
}

sudo qemu-system-x86_64 \
    -enable-kvm \
    -m $MEM \
    -machine q35,accel=kvm \
    -smp $CPUS, $CORE\
    -cpu Penryn,vendor=GenuineIntel,kvm=on,+sse3,+sse4.2,+aes,+xsave,+avx,+xsaveopt,+xsavec,+xgetbv1,+avx2,+bmi2,+smep,+bmi1,+fma,+movbe,+invtsc \
    -device isa-applesmc,osk="$OSK" \
    -smbios type=2 \
    -drive if=pflash,format=raw,readonly,file="$OVMF/OVMF_CODE.fd" \
    -drive if=pflash,format=raw,file="$OVMF/OVMF_VARS-1024x768.fd" \
    -device VGA, $VGAMEM \
    -device virtio-serial-pci \
    -soundhw hda \
    -usb -device usb-kbd -device usb-tablet \
    -netdev user,id=net0 \
    -device e1000-82545em,netdev=net0,id=net0,mac=52:54:00:0e:0d:20 \
    -device ich9-ahci,id=sata \
    -drive id=ESP,if=none,format=qcow2,file=ESP.qcow2 \
    -device ide-hd,bus=sata.2,drive=ESP \
    -drive id=InstallMedia,format=raw,if=none,file=BaseSystem.img \
    -device ide-hd,bus=sata.3,drive=InstallMedia \
    -drive id=SystemDisk,if=none,file="${SYSTEM_DISK}" \
    -device ide-hd,bus=sata.4,drive=SystemDisk \
    "${MOREARGS[@]}"
