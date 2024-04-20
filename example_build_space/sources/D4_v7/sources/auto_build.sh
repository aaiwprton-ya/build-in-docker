#!/bin/bash

cd $(dirname "$0")
cd ./D4_v7
g++ -c -o d4_v7.o d4_v7.cpp
g++ -fPIC -c -o d4_v7.o.so d4_v7.cpp
ar rcs libd4_v7.a d4_v7.o
g++ -shared -o libd4_v7.so d4_v7.o.so
g++ -o d4_v7.out main.cpp libd4_v7.a
g++ -o d4_v7.out.so main.cpp -I/home/worker/workroom/dependencies/include -L/home/worker/workroom/dependencies/lib -L./ -ld4_v7

cp ./libd4_v7.a /home/worker/workroom/builds
cp ./libd4_v7.so /home/worker/workroom/builds
cp ./d4_v7.out /home/worker/workroom/builds
cp ./d4_v7.out.so /home/worker/workroom/builds
cp ./d4_v7.h /home/worker/workroom/builds

mkdir -p /home/worker/workroom/installations/bin
mkdir -p /home/worker/workroom/installations/include
mkdir -p /home/worker/workroom/installations/lib
mkdir -p /home/worker/workroom/installations/share

cp ./libd4_v7.a /home/worker/workroom/installations/lib
cp ./libd4_v7.so /home/worker/workroom/installations/lib
cp ./d4_v7.out /home/worker/workroom/installations/bin
cp ./d4_v7.out.so /home/worker/workroom/installations/bin
cp ./d4_v7.h /home/worker/workroom/installations/include

mkdir -p /home/worker/workroom/installations/share/d4_v7_share_dir
cd /home/worker/workroom/installations/share/d4_v7_share_dir
touch d4_v7_share1
touch d4_v7_share2
touch d4_v7_share3
touch d4_v7_share4

