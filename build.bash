#!/usr/bin/env bash

IMAGE_NAME=docker-build-server

pushd builder && python setup.py bdist_egg --plat-name generic && popd

cp builder/dist/builder-0.0.1-py2.7.egg docker/

pushd docker && docker build -t $IMAGE_NAME . && popd
