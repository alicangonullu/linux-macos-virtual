#!/bin/bash
OSK="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VMDIR=../
OVMF=$VMDIR/firmware
TOOLS=$PWD/forwin

SYSTEM_DISK="${PWD}/MyDisk.qcow2"
BASE_DISK="${PWD}/BaseSystem.img"
BOOT_DISK="${PWD}/ESP.qcow2"

"$TOOLS/dmg2img.exe" "$TOOLS/BaseSystem/BaseSystem.dmg" "$PWD/BaseSystem.img"
$PWD/forwin/qemu/qemu-img.exe create -f qcow2 $PWD/MyDisk.qcow2 30G

$PWD/forwin/qemu/qemu-system-x86_64.exe \
    -m 2G \
    -smp cpus=3 \
    -machine q35 \
    -cpu Penryn,vendor=GenuineIntel,+sse3,+sse4.2,+aes,+xsave,+avx,+xsaveopt,+xsavec,+xgetbv1,+avx2,+bmi2,+smep,+bmi1,+fma,+movbe,+invtsc \
    -device isa-applesmc,osk="$OSK" \
    -smbios type=2 \
    -drive if=pflash,format=raw,readonly,file="$OVMF/OVMF_CODE.fd" \
    -drive if=pflash,format=raw,file="$OVMF/OVMF_VARS-1024x768.fd" \
    -vga std \
    -device virtio-serial-pci \
    -soundhw hda \
    -usb -device usb-kbd -device usb-tablet \
    -netdev user,id=net0 \
    -device e1000-82545em,netdev=net0,id=net0,mac=52:54:00:0e:0d:20 \
    -device ich9-ahci,id=sata \
    -drive id=ESP,if=none,format=qcow2,file=$BOOT_DISK \
    -device ide-hd,bus=sata.2,drive=ESP \
    -drive id=InstallMedia,format=raw,if=none,file=$BASE_DISK \
    -device ide-hd,bus=sata.3,drive=InstallMedia \
    -drive id=SystemDisk,if=none,file="${SYSTEM_DISK}" \
    -device ide-hd,bus=sata.4,drive=SystemDisk \
    -k tr
