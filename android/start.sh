TOOLS=$PWD/araclar
sudo chmod +x kvm-basla.sh
chmod +x temizle.sh
chmod +x $TOOLS/FetchMacOS/fetch.sh
apt install python3 python-pip
clear

kullanim_goster() {
    echo
    echo "Kullanım: $0"
    echo
    echo " -y, --yardim        Yardım."
    echo " -s, --high-sierra   High Sierra Kurulumu."
    echo " -m, --mojave        Mojave Kurulumu."
    echo " -c, --catalina      Catalina Kurulumu."
    echo
}

error() {
    local error_message="$*"
    echo "${error_message}" 1>&2;
}

argument="$1"
case $argument in
    -y|--yardim)
        kullanim_goster
        ;;
    -s|--high-sierra)
        "$TOOLS/FetchMacOS/fetch.sh" -v 10.13 || exit 1;
        ;;
    -m|--mojave)
        "$TOOLS/FetchMacOS/fetch.sh" -v 10.14 || exit 1;
        ;;
    -c|--catalina|*)
        "$TOOLS/FetchMacOS/fetch.sh" -v 10.15 || exit 1;
        ;;
esac

"$TOOLS/dmg2img" "$TOOLS/FetchMacOS/BaseSystem/BaseSystem.dmg" "$PWD/BaseSystem.img"

wget https://github.com/alicangonullu/linux-macos-virtual/raw/master/android/limbo.apk --no-check-certificate

echo "---------------------------------"
echo -n "MacOS'u Başlatalım Mı (y/n)? "
echo "---------------------------------"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
qemu-img create -f qcow2 MyDisk.qcow2 8G
clear
echo "---------------------------------"
echo "For Android (Limbo PC Emulator)"
echo "Create Filesystem : MyFile.qcow2 ( Min : 8GB )"
echo "Add Filesystem : ESP.qcow2 / BaseSystem.img"
echo "---------------------------------"

else
qemu-img create -f qcow2 MyDisk.qcow2 8G
clear
echo "---------------------------------"
echo "Author / Yazar : Ali Can GÖNÜLLÜ"
echo "For Android (Limbo PC Emulator)"
echo "Create Filesystem : MyFile.qcow2 ( Min : 8GB )"
echo "Add Filesystem : ESP.qcow2 / BaseSystem.img"
echo "---------------------------------"
fi
