FROM debian:latest

ENV CLINGO_TAG_VERSION clingo-3

RUN apt-get update && \
  apt-get install -y git build-essential cmake bison re2c libboost-all-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists

RUN mkdir /opt/clingo
RUN cd /opt/clingo && \
  git init && \
  git remote add origin https://github.com/potassco/clingo.git && \
  git fetch origin ${CLINGO_TAG_VERSION} && \
  git pull origin ${CLINGO_TAG_VERSION} && \
  git submodule update --init --recursive && \
  sed -i '1d' CMakeLists.txt && \
  sed -i "1s;^;cmake_minimum_required(VERSION 2.6)\ncmake_policy(SET CMP0054 OLD)\ncmake_policy(SET CMP0045 OLD);" CMakeLists.txt
  

WORKDIR /opt/clingo
RUN mkdir build && \
    cd build && \
    cmake -H/opt/clingo -B/opt/clingo -DCMAKE_BUILD_TYPE=release ../ && \
    cmake --build /opt/clingo/build

ENV PATH $PATH:/opt/clingo/build/bin
