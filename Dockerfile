FROM ubuntu:20.04 AS sources

RUN apt-get update \
    && apt-get -y install software-properties-common \
    && add-apt-repository ppa:ubuntu-toolchain-r/test \
    && apt-get update
 
FROM ubuntu:20.04
COPY --from=sources /etc/apt/ /etc/apt/
COPY --from=sources /var/lib/apt/lists/ /var/lib/apt/lists/
RUN apt-get -y install gcc-10
