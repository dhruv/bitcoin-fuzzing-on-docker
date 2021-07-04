FROM ubuntu:focal

RUN apt update
RUN apt -y dist-upgrade
RUN apt install -y git
RUN apt install -y sudo
RUN apt install -y vim
RUN apt install -y build-essential
RUN apt install -y libtool
RUN apt install -y autotools-dev
RUN apt install -y automake
RUN DEBIAN_FRONTEND=noninteractive apt install -y pkg-config
RUN apt install -y bsdmainutils
RUN apt install -y python3
RUN apt install -y libevent-dev
RUN apt install -y libboost-dev
RUN apt install -y libboost-system-dev
RUN apt install -y libboost-filesystem-dev
RUN apt install -y libboost-test-dev
RUN apt install -y libboost-all-dev
RUN apt install -y libsqlite3-dev
RUN apt install -y libminiupnpc-dev
RUN apt install -y libnatpmp-dev
RUN apt install -y libzmq3-dev
RUN apt install -y clang
RUN apt install -y libdb++-dev
RUN apt install -y libdb-dev
RUN apt install -y lldb
RUN apt install -y libssl-dev

RUN mkdir -p /bitcoin /qa-assets /bitcoin-seeder

