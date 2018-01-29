#!/bin/bash

if [[ ! -d ./build ]]; then
    echo "Missing ./build directory"
    exit 1
fi

docker run --rm -v $PWD/build:/build piger/buildazzo
