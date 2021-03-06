[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Falicangonullu%2Flinux-macos-virtual.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Falicangonullu%2Flinux-macos-virtual?ref=badge_shield)

<h1>Linux Automatic KVM macOS Installer / Remover</h1>
<b> Windows/Android Beta, Linux Full Support </b>
<br>
<b>Bu Nedir ?</b>
<hr></hr>
<b>Linux ortamında macOS kullanabilmeniz için hazırlanmış bir sistemdir</b>
<hr></hr>
<pre>
Recomments :
Jailbreak / Root (For Mobile)
Python 3.x (For iOS Add Repo mcapollo.github.io/Public or iosrepo.cyberarchive.top To Cydia)
qemu and VNC Client (For iOS)
Bash System (For Windows No)
Limbo Emulator (For Android) </pre>
<b>Nasıl Çalışır ?</b>
<br>
<b> Linux : (OR Android)</b>
<hr></hr>
<pre>Yükleme Için (For Install) :
  ./start.sh -x
  x = -m (Mojave), -s (Sierra), -c (Catalina), -y (Yardım)
  Başlatmak İçin :
  ./kvm-basla.sh
  Temizlemek İçin :
  ./temizle.sh
  
Android :
Yükleme Için (For Install) :
  android/start.sh -x
  x = -m (Mojave), -s (Sierra), -c (Catalina), -y (Yardım)
  Temizlemek İçin :
  android/temizle.sh

iOS (VNC 127.0.0.1) :
Yükleme Için (For Install) :
  ios/start.sh -x
  x = -m (Mojave), -s (Sierra), -c (Catalina), -y (Yardım)
  Temizlemek İçin :
  ios/temizle.sh
</pre>
<b> Windows : </b>
<hr></hr>
<pre>
win-install.bat (For Install)
win-basla.bat
</pre>
<hr></hr>
If you have sound problem, please edit kvm-basla.sh (Eğer ses sorununuz olursa kvm-basla.sh'ı düzenleyin) :
<pre>
export QEMU_AUDIO_DRV=pa
QEMU_AUDIO_DRV=pa
</pre>
delete this code (bu kodu silin)
<hr></hr>
If do you need upgrade RAM, CPU or Extra Options ? Please Edit kvm-basla.sh ( Yükseltme RAM, CPU veya Ekstra Seçeneklere ihtiyacınız varsa, lütfen kvm-basla.sh düzenleyin:):
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
Edit or add new options (Yeni ayar düzenleyin veya ekleyin)

<b>To Install on Disk</b>
<pre>Disk Utility->Erase->30 GB Disk->MacOS Journal Format
the process. Then proceed to the installation. (işlemini yapın. Ardından kuruluma geçin.)</pre>
<img src="https://raw.githubusercontent.com/alicangonullu/linux-macos-virtual/master/resim1.png" width="800" height="500">
<img src="https://raw.githubusercontent.com/alicangonullu/linux-macos-virtual/master/resim2.png" width="800" height="500">
<img src="https://raw.githubusercontent.com/alicangonullu/linux-macos-virtual/master/resim3.png" width="800" height="500">
<img src="https://raw.githubusercontent.com/alicangonullu/linux-macos-virtual/master/resim4.png" width="800" height="500">
<img src="https://raw.githubusercontent.com/alicangonullu/linux-macos-virtual/master/resim5.png" width="800" height="500">
<img src="https://raw.githubusercontent.com/alicangonullu/linux-macos-virtual/master/resim6.png" width="800" height="500">
<br>

