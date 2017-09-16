#!/bin/bash

command="$1"

shift

function run_build {
  if [[ $# < 1 || -z "$1" ]]; then
    echo "Repository URL required."
    exit 1
  fi

  repo="$1"

  mkdir -p $HOME/code && cd $HOME/code

  checkout_directory="source"

  git clone "$repo" "$checkout_directory"

  pushd "$checkout_directory"
  git submodule update --init
  popd

  mkdir -p build-debug && cd build-debug

  cmake -DCMAKE_BUILD_TYPE=debug ../"$checkout_directory"

  make
}

function start_shell {
  exec /bin/bash
}

case "$command" in
  build)
    run_build "$1"
    ;;
  bash)
    start_shell
    ;;
  *)
    echo "Usage: $0 (build|bash)"
    exit 1
    ;;
esac
