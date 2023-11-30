FROM golang:1.18

RUN apt-get update && apt-get install -y \
  build-essential \
  libssl-dev \
  libpng-dev \
  curl \
  yasm \
  pkg-config \
  libtool \
  autoconf \
  automake

RUN curl https://ffmpeg.org/releases/ffmpeg-6.0.tar.bz2 | tar xj && \
    cd ffmpeg-6.0 && \
    ./configure --disable-yasm --disable-gnutls --enable-openssl --enable-encoder=png && \
    make -j$(nproc) && \
    make install
