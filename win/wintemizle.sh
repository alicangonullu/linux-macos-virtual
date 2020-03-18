TOOLS=$PWD/forwin
clear

echo "---------------------------------"
echo -n "Silmek İstediğinize Emin Misiniz (y/n)? "
echo "---------------------------------"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
rm -r $TOOLS/BaseSystem/BaseSystem.dmg 
rm -r $TOOLS/BaseSystem
rm -r $PWD/BaseSystem.img
rm -r $PWD/MyDisk.qcow2
rm -r $PWD/get-pip.py
else
clear
echo "---------------------------------"
echo "İptal Edildi"
echo "---------------------------------"
fi
