FROM ubuntu:20.04

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test \
    && apt-get update
RUN apt-get -y install gcc-10

