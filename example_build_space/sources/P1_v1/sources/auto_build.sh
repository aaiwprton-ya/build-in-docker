#!/bin/bash

cd $(dirname "$0")
cd ./P1_v1
g++ -c -o p1_v1.o p1_v1.cpp -I/home/worker/workroom/dependencies/include -L/home/worker/workroom/dependencies/lib
g++ -o p1_v1.out main.cpp p1_v1.o -I/home/worker/workroom/dependencies/include -L/home/worker/workroom/dependencies/lib -l:libd1_v1.a -l:libd2_v3.a -l:libd3_v5.a
g++ -o p1_v1.out.so main.cpp p1_v1.o -I/home/worker/workroom/dependencies/include -L/home/worker/workroom/dependencies/lib -ld1_v1 -ld2_v3 -ld3_v5

cp ./p1_v1.out /home/worker/workroom/builds
cp ./p1_v1.out.so /home/worker/workroom/builds

mkdir -p /home/worker/workroom/installations/bin
mkdir -p /home/worker/workroom/installations/include
mkdir -p /home/worker/workroom/installations/lib
mkdir -p /home/worker/workroom/installations/share

cp ./p1_v1.out /home/worker/workroom/installations/bin
cp ./p1_v1.out.so /home/worker/workroom/installations/bin

mkdir -p /home/worker/workroom/installations/share/p1_v1_share_dir
cd /home/worker/workroom/installations/share/p1_v1_share_dir
touch p1_v1_share1
touch p1_v1_share2
touch p1_v1_share3
touch p1_v1_share4

