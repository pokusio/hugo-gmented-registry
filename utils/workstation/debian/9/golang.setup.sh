#!/bin/bash

if [ "x${GOLANG_VERSION}" == "x" ]; then
  echo "[$0] - The GOLANG_VERSION environment variable is not set, but must be"
fi;
export GOLANG_VERSION=${GOLANG_VERSION:-'1.17.4'}
echo "GOLANG_VERSION=[${GOLANG_VERSION}]"

export PATH=$PATH:/usr/local/go/bin
export GOLANG_EXECUTABLE="/usr/local/go/bin/go"
export GOLANG_EXECUTABLE=$(which go)

if [ -f ${GOLANG_EXECUTABLE} ]; then
  echo "GOLANG_EXECUTABLE=[${GOLANG_EXECUTABLE}] does EXIST YES"
else
  echo "GOLANG_EXECUTABLE=[${GOLANG_EXECUTABLE}] does NOT EXISTS NO"
fi;

if [ -d /usr/local/go ]; then
  sudo rm -fr /usr/local/go
fi;

sudo mkdir -p /usr/local/go

curl -LO https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz

ls -alh ./go${GOLANG_VERSION}.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf ./go${GOLANG_VERSION}.linux-amd64.tar.gz
