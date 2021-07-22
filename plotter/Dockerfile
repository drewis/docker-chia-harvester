FROM ubuntu:20.04 as builder

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y \
	libsodium-dev cmake g++ git build-essential

# Clone plotter
RUN git clone --recursive https://github.com/madMAx43v3r/chia-plotter.git

# Build plotter
RUN cd chia-plotter \
&& mkdir -p build \
&& cd build \
&& cmake -DARITH="easy" -DBUILD_BLS_PYTHON_BINDINGS=false -DCMAKE_BUILD_TYPE="RelWithDebInfo" .. \
&& make -j4 chia_plot

RUN mkdir -p /opt/madmax/bin \
&& cp -v chia-plotter/build/chia_plot /opt/madmax/bin/


FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y \
	curl bash git python3.8-venv python3-distutils libsodium-dev tzdata
#	curl jq python3 ansible tar bash ca-certificates git openssl unzip wget \
#	python3-pip sudo acl build-essential python3-dev python3.8-venv \
#	python3.8-distutils apt nfs-common python-is-python3 vim tzdata

RUN useradd -d /chia -m -u 1000 -U -s /bin/bash chia

USER chia
WORKDIR /chia

ENV PATH="/opt/madmax/bin::$PATH"

COPY --from=builder /opt/ /opt/

