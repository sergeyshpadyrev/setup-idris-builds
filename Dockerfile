FROM ubuntu:latest

RUN apt update && apt -y install chezscheme wget

ARG idris_build_version

RUN wget -O idris2-ubuntu.tar.gz https://github.com/sergeyshpadyrev/setup-idris-builds/releases/download/$idris_build_version/idris2-ubuntu.tar.gz
RUN tar -xvf idris2-ubuntu.tar.gz -C /root
RUN rm ./idris2-ubuntu.tar.gz
RUN echo 'export PATH="/root/.idris2/bin/:${PATH}"' >> "${HOME}/.bashrc"
RUN ln -sf /root/.idris2/bin/idris2 /root/.idris2/bin/idris
