#!/bin/bash

return_path=$(pwd)
cd $(dirname "$0")
cd ./P1_v1
rm ./*.o ./*.a ./*.so ./*.out ./*.out.so
cd $return_path

