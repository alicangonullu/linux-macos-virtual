TOOLS=$PWD/forwin
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
        "$TOOLS/fetch.sh" -v 10.13 || exit 1;
        ;;
    -m|--mojave)
        "$TOOLS/fetch.sh" -v 10.14 || exit 1;
        ;;
    -c|--catalina|*)
        "$TOOLS/fetch.sh" -v 10.15 || exit 1;
        ;;
esac
"$TOOLS/dmg2img.exe" "$TOOLS/BaseSystem/BaseSystem.dmg" "$PWD/BaseSystem.img"

echo "---------------------------------"
echo -n "MacOS'u Başlatalım Mı (y/n)? "
echo "---------------------------------"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
sh $PWD/forwin/winbasla.sh
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
$PWD/forwin/qemu/qemu-img.exe create -f qcow2 MyDisk.qcow2 30G
clear
echo "---------------------------------"
echo "Author / Yazar : Ali Can GÖNÜLLÜ"
echo "Başlatmak için ./winbasla.sh yazın"
echo "Temizlemek için ./wintemizle.sh yazın"
echo "---------------------------------"
fi
