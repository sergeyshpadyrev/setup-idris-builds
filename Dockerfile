FROM ubuntu:latest

ARG IDRIS_BUILD_VERSION

RUN apt-get -y install chezscheme
RUN wget -O idris2-ubuntu.tar.gz https://github.com/sergeyshpadyrev/setup-idris-builds/releases/download/${IDRIS_BUILD_VERSION}/idris2-ubuntu.tar.gz 
RUN tar -xvf idris2-ubuntu.tar.gz -C ~
RUN rm ./idris2-ubuntu.tar.gz
RUN echo 'export PATH="~/.idris2/bin/:${PATH}"' >> "~/.bashrc"
RUN ln -sf ~/.idris2/bin/idris2 ~/.idris2/bin/idris
