#!/bin/bash

cd $(dirname "$0")
this_path=$(pwd)
cd ../../builds
host_builds=$(pwd)
cd $this_path
mkdir -p builds installations
docker build -t docker-builder-d4_v7 ./
docker run --rm -v $(pwd)/sources:/home/worker/workroom/sources \
	-v $(pwd)/builds:/home/worker/workroom/builds \
	-v $(pwd)/installations:/home/worker/workroom/installations \
	-v $host_builds:/home/worker/workroom/dependencies docker-builder-d4_v7
docker rmi docker-builder-d4_v7
cd $this_path
touch ./.isbuilded
echo "true" > ./.isbuilded
