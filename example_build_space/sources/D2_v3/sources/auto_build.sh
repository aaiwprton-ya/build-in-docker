#!/bin/bash

cd $(dirname "$0")
cd ./D2_v3
g++ -c -o d2_v3.o d2_v3.cpp
g++ -fPIC -c -o d2_v3.o.so d2_v3.cpp
ar rcs libd2_v3.a d2_v3.o
g++ -shared -o libd2_v3.so d2_v3.o.so
g++ -o d2_v3.out main.cpp libd2_v3.a
g++ -o d2_v3.out.so main.cpp -I/home/worker/workroom/dependencies/include -L/home/worker/workroom/dependencies/lib -L./ -ld2_v3

cp ./libd2_v3.a /home/worker/workroom/builds
cp ./libd2_v3.so /home/worker/workroom/builds
cp ./d2_v3.out /home/worker/workroom/builds
cp ./d2_v3.out.so /home/worker/workroom/builds
cp ./d2_v3.h /home/worker/workroom/builds

mkdir -p /home/worker/workroom/installations/bin
mkdir -p /home/worker/workroom/installations/include
mkdir -p /home/worker/workroom/installations/lib
mkdir -p /home/worker/workroom/installations/share

cp ./libd2_v3.a /home/worker/workroom/installations/lib
cp ./libd2_v3.so /home/worker/workroom/installations/lib
cp ./d2_v3.out /home/worker/workroom/installations/bin
cp ./d2_v3.out.so /home/worker/workroom/installations/bin
cp ./d2_v3.h /home/worker/workroom/installations/include

mkdir -p /home/worker/workroom/installations/share/d2_v3_share_dir
cd /home/worker/workroom/installations/share/d2_v3_share_dir
touch d2_v3_share1
touch d2_v3_share2
touch d2_v3_share3
touch d2_v3_share4

