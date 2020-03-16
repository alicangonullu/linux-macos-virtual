#!/bin/bash
set +x;
SCRIPTDIR="$(dirname "$0")";
TOOLS=$PWD/forwin

cd "$SCRIPTDIR"

pip install -r requirements.txt --user
down-os.py "$@"
exit;
