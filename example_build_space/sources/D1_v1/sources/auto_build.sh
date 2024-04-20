#!/bin/bash

cd $(dirname "$0")
cd ./D1_v1
g++ -c -o d1_v1.o d1_v1.cpp
g++ -fPIC -c -o d1_v1.o.so d1_v1.cpp
ar rcs libd1_v1.a d1_v1.o
g++ -shared -o libd1_v1.so d1_v1.o.so
g++ -o d1_v1.out main.cpp libd1_v1.a
g++ -o d1_v1.out.so main.cpp -I/home/worker/workroom/dependencies/include -L/home/worker/workroom/dependencies/lib -L./ -ld1_v1

cp ./libd1_v1.a /home/worker/workroom/builds
cp ./libd1_v1.so /home/worker/workroom/builds
cp ./d1_v1.out /home/worker/workroom/builds
cp ./d1_v1.out.so /home/worker/workroom/builds
cp ./d1_v1.h /home/worker/workroom/builds

mkdir -p /home/worker/workroom/installations/bin
mkdir -p /home/worker/workroom/installations/include
mkdir -p /home/worker/workroom/installations/lib
mkdir -p /home/worker/workroom/installations/share

cp ./libd1_v1.a /home/worker/workroom/installations/lib
cp ./libd1_v1.so /home/worker/workroom/installations/lib
cp ./d1_v1.out /home/worker/workroom/installations/bin
cp ./d1_v1.out.so /home/worker/workroom/installations/bin
cp ./d1_v1.h /home/worker/workroom/installations/include

mkdir -p /home/worker/workroom/installations/share/d1_v1_share_dir
cd /home/worker/workroom/installations/share/d1_v1_share_dir
touch d1_v1_share1
touch d1_v1_share2
touch d1_v1_share3
touch d1_v1_share4

