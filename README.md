<h1>Linux Automatic KVM macOS Installer / Remover</h1>
<br>
<b>Bu Nedir ?</b>
<hr></hr>
<b>Linux ortamında macOS kullanabilmeniz için hazırlanmış bir sistemdir</b>
<hr></hr>
<b>Nasıl Çalışır ?</b>
<hr></hr>
<pre>Yükleme Için :
  ./start.sh -x
  x = -m (Mojave), -s (Sierra), -c (Catalina), -y (Yardım)
  Başlatmak İçin :
  ./kvm-basla.sh
  Temizlemek İçin :
  ./temizle.sh
</pre>
If you have sound problem, please edit kvm-basla.sh (Eğer ses sorununuz olursa kvm-basla.sh'ı düzenleyin) :
<pre>
export QEMU_AUDIO_DRV=pa
QEMU_AUDIO_DRV=pa
</pre>
delete this code (bu kodu silin)

If do you need upgrade RAM, CPU or Extra Options ?, Please Edit kvm-basla.sh ( Yükseltme RAM, CPU veya Ekstra Seçeneklere ihtiyacınız varsa, lütfen kvm-basla.sh düzenleyin:):
<pre>
SYSTEM_DISK="MyDisk.qcow2"

[[ -z "$MEM" ]] && {
	MEM="2G"
}

[[ -z "$CPUS" ]] && {
	CPUS=2
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
    MOREARGS+=(-nographic -vnc :0 -k en-us)
}
</pre>
Edit or add new options/settings
<br>
