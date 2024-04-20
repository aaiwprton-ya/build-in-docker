FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

## setup image properties
MAINTAINER aaiwprton <aaiwprtony@yandex.ru>
LABEL   name="base-docker-builder" \
	    description="Docker image with a build tools" \
	    version="1" \
	    change-log="v1: Started"

## setup users
RUN groupadd --gid 1000 worker \
	&& useradd --uid 1000 --gid worker --shell /bin/bash --create-home worker

## setup user environment
RUN mkdir /home/worker/workroom
WORKDIR /home/worker/workroom
RUN mkdir ./sources ./builds ./installations ./dependencies

## install main tools
RUN apt-get update && apt-get -y upgrade \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
	nasm gcc g++ gdb make cmake

# setup user mode
RUN chown -hR worker:worker /home/worker
USER worker

ENTRYPOINT ["/bin/bash"]
