set +x;
SCRIPTDIR="$(dirname "$0")";
cd "$SCRIPTDIR"

initpip() {
    if [ -x "$(command -v easy_install)" ]; then
        sudo easy_install pip
    else
        echo "Python3-Pip Yüklemelisiniz."
        exit 1;
    fi
    pip install -r requirements.txt --user
}

pip_getir(){
    if [ -x "$(command -v pip3)" ]; then
        pip3 install -r requirements.txt --user
    elif [ -x "$(command -v pip)" ]; then
        pip install -r requirements.txt --user
    else
        echo "Pip zaten kurulu..." >&2
        initpip
    fi
}

python_getir(){
    if [ -x "$(command -v python3)" ]; then
        PYTHONBIN=python3
    elif [ -x "$(command -v python)" ]; then
        PYTHONBIN=python
    elif [ -x "$(command -v python2)" ]; then
        PYTHONBIN=python2
    else
        echo "Python 3 Gereklidir." >&2
        exit 1;
    fi
}

pip_getir
python_getir
$PYTHONBIN fetch-macos.py "$@"

clear
echo "---------------------------------"
echo "== Distro Hakkında ==" >&2
lsb_release -a
echo "---------------------------------"

echo "== Yüklenen Modüller ==" >&2
lsmod | grep kvm
lsmod | grep amd_iommu
lsmod | grep intel_iommu
echo "---------------------------------"

echo "== Yüklenen QEMU ==" >&2
if [ -x "$(command -v qemu-system-x86_64)" ]; then
    qemu-system-x86_64 --version
else
    echo "QEMU Yüklenemedi." >&2
fi
echo "---------------------------------"

if [ -x "$(command -v virt-manager)" ]; then
    echo "virt-manager version $(virt-manager --version)"
else
    echo "virt-manager is not installed." >&2
fi
echo "---------------------------------"
if [ -x "$(command -v python)" ]; then
    python --version
else
    echo "Python Yüklenemedi." >&2
fi
echo "---------------------------------"
if [ -x "$(command -v pip)" ]; then
    pip --version
else
    echo "Pip Yüklenemedi." >&2
fi
exit;
