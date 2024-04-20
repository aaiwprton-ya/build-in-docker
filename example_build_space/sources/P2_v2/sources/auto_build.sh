#!/bin/bash

cd $(dirname "$0")
cd ./P2_v2
g++ -c -o p2_v2.o p2_v2.cpp -I/home/worker/workroom/dependencies/include -L/home/worker/workroom/dependencies/lib
g++ -o p2_v2.out main.cpp p2_v2.o -I/home/worker/workroom/dependencies/include -L/home/worker/workroom/dependencies/lib -l:libd2_v3.a -l:libd3_v5.a -l:libd4_v7.a
g++ -o p2_v2.out.so main.cpp p2_v2.o -I/home/worker/workroom/dependencies/include -L/home/worker/workroom/dependencies/lib -ld2_v3 -ld3_v5 -ld4_v7

cp ./p2_v2.out /home/worker/workroom/builds
cp ./p2_v2.out.so /home/worker/workroom/builds

mkdir -p /home/worker/workroom/installations/bin
mkdir -p /home/worker/workroom/installations/include
mkdir -p /home/worker/workroom/installations/lib
mkdir -p /home/worker/workroom/installations/share

cp ./p2_v2.out /home/worker/workroom/installations/bin
cp ./p2_v2.out.so /home/worker/workroom/installations/bin

mkdir -p /home/worker/workroom/installations/share/p2_v2_share_dir
cd /home/worker/workroom/installations/share/p2_v2_share_dir
touch p2_v2_share1
touch p2_v2_share2
touch p2_v2_share3
touch p2_v2_share4

