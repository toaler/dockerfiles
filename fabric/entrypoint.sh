#!/bin/bash

# Run any custom setup or environment initialization here
if [ "$1" = "fabric" ]; then
  shift
  /go/bin/fabric "$@"
else
  exec "$@"
fi

