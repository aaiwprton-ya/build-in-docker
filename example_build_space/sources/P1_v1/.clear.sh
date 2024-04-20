#!/bin/bash

return_path=$(pwd)
cd $(dirname "$0")
this_path=$(pwd)
./.uninstall.sh
cd ./installations
rm -rfv ./*
cd ../builds
rm -rfv ./*
cd ../sources
./auto_remove.sh
cd $this_path
touch ./.isbuilded
echo "false" > ./.isbuilded
cd $return_path
