# Build Stage
FROM --platform=linux/amd64 ubuntu:22.04 as builder
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y llvm-13-dev clang-13 libz-dev cmake make

ADD . /cone
WORKDIR /cone
RUN CC=clang-13 CXX=clang++-13 cmake .
RUN make
