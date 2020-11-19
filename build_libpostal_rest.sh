#!/usr/bin/env bash
set -e

curl https://dl.google.com/go/go1.15.5.linux-amd64.tar.gz > go1.15.5.linux-amd64.tar.gz

echo "9a58494e8da722c3aef248c9227b0e9c528c7318309827780f16220998180a0d go1.15.5.linux-amd64.tar.gz" | sha256sum -c

tar xzf go1.15.5.linux-amd64.tar.gz

export GOROOT=/libpostal/go
export GOPATH=/libpostal/workspace
export PATH=$PATH:/libpostal/go/bin

go get github.com/johnlonganecker/libpostal-rest

go install github.com/johnlonganecker/libpostal-rest
