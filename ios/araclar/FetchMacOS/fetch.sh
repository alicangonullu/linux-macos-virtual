#!/bin/bash

set +x;
SCRIPTDIR="$(dirname "$0")";
cd "$SCRIPTDIR"

initpip() {
    if [ -x "$(command -v easy_install)" ]; then
        sudo easy_install pip
    else
        echo "Python3-Pip Yükleyiniz."
        exit 1;
    fi
    python3 -m ensurepip
}

getpip(){
    if [ -x "$(command -v pip3)" ]; then
        pip3 install -r requirements.txt --user
    elif [ -x "$(command -v pip)" ]; then
        pip install -r requirements.txt --user
    else
        echo "Pip Yüklendi..." >&2
        initpip
    fi
}

getpython(){
    if [ -x "$(command -v python3)" ]; then
        PYTHONBIN=python3
    elif [ -x "$(command -v python)" ]; then
        PYTHONBIN=python
    elif [ -x "$(command -v python2)" ]; then
        PYTHONBIN=python2
    else
        echo "Python3 Yükleyin." >&2
        exit 1;
    fi
}

getpip
getpython
$PYTHONBIN down-os.py "$@"

exit;
