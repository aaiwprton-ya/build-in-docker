#!/bin/bash

return_path=$(pwd)
cd $(dirname "$0")
cd ./D2_v3
rm ./*.o ./*.a ./*.so ./*.out ./*.out.so
cd $return_path

