#!/bin/bash

command="$1"

if [[ ! "$command" == "bash" ]]; then

  mkdir -p $HOME/code && cd $HOME/code

  git clone https://github.com/wdicharry/xdm

  mkdir build-debug && cd build-debug

  cmake -DCMAKE_BUILD_TYPE=Debug ../xdm

  make
else
  exec /bin/bash
fi
