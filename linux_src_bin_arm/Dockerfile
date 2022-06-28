FROM arm64v8/ubuntu

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  make g++

WORKDIR /testing

ENTRYPOINT make -B && ./phenom2_benchmark_arm
