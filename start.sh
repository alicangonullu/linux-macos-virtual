TOOLS=$PWD/araclar
sudo chmod +x kvm-basla.sh
chmod +x temizle.sh
apt update
sudo apt-get install qemu-system qemu-utils python3 python3-pip
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
echo "Başlıyor..."
echo "---------------------------------"

else
qemu-img create -f qcow2 MyDisk.qcow2 30G
chmod +x kvm-basla.sh
clear
echo "---------------------------------"
echo "Başlatmak için ./kvm-basla.sh yazın"
echo "Temizlemek için ./temizle.sh yazın"
echo "---------------------------------"
fi
