FROM ubuntu:latest

ARG WSL_VERSION=5.15

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget \
    tar \
    build-essential \
    flex \
    bison \
    libelf-dev \
    libssl-dev \
    libnewt-dev \
    libncurses5-dev \
    libdw-dev \
    binutils-dev \
    dpkg-dev \
    fakeroot \
    python3

WORKDIR /usr/src
RUN <<COMMAND
    wget https://github.com/microsoft/WSL2-Linux-Kernel/archive/refs/heads/linux-msft-wsl-${WSL_VERSION}.y.tar.gz -O linux-msft-wsl.tar.gz
    mkdir linux
    tar -C linux -xf linux-msft-wsl.tar.gz --strip-components=1
    cd linux/tools/perf
    make LDFLAGS='-static'
COMMAND

WORKDIR /usr/src/perf
RUN <<COMMAND
    mkdir -p usr/bin DEBIAN
    cp -p /usr/src/linux/tools/perf/perf usr/bin/
COMMAND

COPY DEBIAN/control DEBIAN/

WORKDIR /usr/src
RUN fakeroot dpkg-deb --build /usr/src/perf
