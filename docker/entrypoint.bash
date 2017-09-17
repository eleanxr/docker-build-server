#!/bin/bash

command="$1"

shift

function run_build {
  exec buildtool $@
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
