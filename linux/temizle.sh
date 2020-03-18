TOOLS=$PWD/araclar
clear

echo "---------------------------------"
echo -n "Silmek İstediğinize Emin Misiniz (y/n)? "
echo "---------------------------------"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
sudo rm -r $TOOLS/FetchMacOS/BaseSystem/BaseSystem.dmg 
rm -r $TOOLS/FetchMacOS/BaseSystem
rm -r $PWD/BaseSystem.img
rm -r MyDisk.qcow2
else
clear
echo "---------------------------------"
echo "İptal Edildi"
echo "---------------------------------"
fi
