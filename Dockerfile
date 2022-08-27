FROM ubuntu:latest

WORKDIR /idris2-compiler

RUN apt update && apt-get -y install build-essential clang chezscheme git
RUN git clone https://github.com/idris-lang/Idris2.git

WORKDIR /idris2-compiler/Idris2

ARG idris_build_version
RUN git checkout $idris_build_version

ENV SCHEME=scheme
ENV PATH="${PATH}:/root/.idris2/bin"

RUN make bootstrap
RUN make install

RUN ln -sf /root/.idris2/bin/idris2 /root/.idris2/bin/idris

WORKDIR /root
RUN rm -r /idris2-compiler
