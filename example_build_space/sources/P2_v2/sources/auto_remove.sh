#!/bin/bash

return_path=$(pwd)
cd $(dirname "$0")
cd ./P2_v2
rm ./*.o ./*.a ./*.so ./*.out ./*.out.so
cd $return_path

