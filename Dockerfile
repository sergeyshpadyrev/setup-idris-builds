FROM ubuntu:latest

ARG idris_build_version

RUN export IDRIS_BUILD_URL=https://github.com/sergeyshpadyrev/setup-idris-builds/releases/download/$idris_build_version/idris2-ubuntu.tar.gz
RUN apt update && apt -y install chezscheme
RUN wget -O idris2-ubuntu.tar.gz $IDRIS_BUILD_URL 
RUN tar -xvf idris2-ubuntu.tar.gz -C ~
RUN rm ./idris2-ubuntu.tar.gz
RUN echo 'export PATH="~/.idris2/bin/:${PATH}"' >> "~/.bashrc"
RUN ln -sf ~/.idris2/bin/idris2 ~/.idris2/bin/idris
