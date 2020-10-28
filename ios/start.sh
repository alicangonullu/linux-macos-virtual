TOOLS=$PWD/araclar
sudo chmod +x kvm-basla.sh
chmod +x temizle.sh
chmod +x $TOOLS/FetchMacOS/fetch.sh
apt update
sudo apt-get install qemu python
clear

echo -n "c = Catalina / h = High Sierra / m = Mojave / u = Unknown"
read selectos

if [ "$selectos" != "${selectos#[Hh]}" ] ;then
"$TOOLS/FetchMacOS/fetch.sh" -v 10.13 || exit 1;
elif [ "$selectos" != "${selectos#[Mm]}" ] ;then
"$TOOLS/FetchMacOS/fetch.sh" -v 10.14 || exit 1;
elif [ "$selectos" != "${selectos#[Cc]}" ] ;then
"$TOOLS/FetchMacOS/fetch.sh" -v 10.15 || exit 1;
elif [ "$selectos" != "${selectos#[Uu]}" ] ;then
"$TOOLS/FetchMacOS/fetch.sh" -v 10.16 || exit 1;
else
  exit 1;
fi

"$TOOLS/dmg2img" "$TOOLS/FetchMacOS/BaseSystem/BaseSystem.dmg" "$PWD/BaseSystem.img"

echo "---------------------------------"
echo -n "MacOS'u Başlatalım Mı (y/n)? "
echo "---------------------------------"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
qemu-img create -f qcow2 MyDisk.qcow2 30G
chmod +x kvm-basla.sh
./kvm-basla.sh
clear
echo "---------------------------------"
echo "Author / Yazar : Ali Can GÖNÜLLÜ"
echo "Başlıyor..."
echo "---------------------------------"
echo "Sonrası İçin :"
echo "---------------------------------"
echo "Başlatmak için ./kvm-basla.sh yazın"
echo "Temizlemek için ./temizle.sh yazın"
echo "---------------------------------"

else
qemu-img create -f qcow2 MyDisk.qcow2 30G
chmod +x kvm-basla.sh
clear
echo "---------------------------------"
kullanim_goster
echo "---------------------------------"
echo "Author / Yazar : Ali Can GÖNÜLLÜ"
echo "Başlatmak için ./kvm-basla.sh yazın"
echo "Temizlemek için ./temizle.sh yazın"
echo "---------------------------------"
fi

