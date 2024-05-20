FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV FORCE_UNSAFE_CONFIGURE=1

RUN apt update
RUN apt install -y build-essential clang flex bison g++ gawk \
gcc-multilib g++-multilib gettext git libncurses-dev libssl-dev \
python3-distutils rsync unzip zlib1g-dev file wget

COPY . /openwrt
WORKDIR /openwrt
# WORKDIR /openwrt/feeds

# RUN git config --global http.proxy http://172.17.0.1:10080

# RUN git clone https://github.com/openwrt/luci.git
# WORKDIR /openwrt/feeds/luci
# RUN git checkout 7739e9f5b03b830f51d53c384be4baef95054cb3

# WORKDIR /openwrt

RUN ./scripts/feeds update -a
RUN ./scripts/feeds install -a
