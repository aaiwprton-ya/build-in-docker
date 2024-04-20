#!/bin/bash

cd $(dirname "$0")
cd ./D3_v5
g++ -c -o d3_v5.o d3_v5.cpp
g++ -fPIC -c -o d3_v5.o.so d3_v5.cpp
ar rcs libd3_v5.a d3_v5.o
g++ -shared -o libd3_v5.so d3_v5.o.so
g++ -o d3_v5.out main.cpp libd3_v5.a
g++ -o d3_v5.out.so main.cpp -I/home/worker/workroom/dependencies/include -L/home/worker/workroom/dependencies/lib -L./ -ld3_v5

cp ./libd3_v5.a /home/worker/workroom/builds
cp ./libd3_v5.so /home/worker/workroom/builds
cp ./d3_v5.out /home/worker/workroom/builds
cp ./d3_v5.out.so /home/worker/workroom/builds
cp ./d3_v5.h /home/worker/workroom/builds

mkdir -p /home/worker/workroom/installations/bin
mkdir -p /home/worker/workroom/installations/include
mkdir -p /home/worker/workroom/installations/lib
mkdir -p /home/worker/workroom/installations/share

cp ./libd3_v5.a /home/worker/workroom/installations/lib
cp ./libd3_v5.so /home/worker/workroom/installations/lib
cp ./d3_v5.out /home/worker/workroom/installations/bin
cp ./d3_v5.out.so /home/worker/workroom/installations/bin
cp ./d3_v5.h /home/worker/workroom/installations/include

mkdir -p /home/worker/workroom/installations/share/d3_v5_share_dir
cd /home/worker/workroom/installations/share/d3_v5_share_dir
touch d3_v5_share1
touch d3_v5_share2
touch d3_v5_share3
touch d3_v5_share4

