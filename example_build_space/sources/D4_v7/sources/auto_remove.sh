#!/bin/bash

return_path=$(pwd)
cd $(dirname "$0")
cd ./D4_v7
rm ./*.o ./*.a ./*.so ./*.out ./*.out.so
cd $return_path

