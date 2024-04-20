#!/bin/bash

return_path=$(pwd)
cd $(dirname "$0")
cd ./D3_v5
rm ./*.o ./*.a ./*.so ./*.out ./*.out.so
cd $return_path

