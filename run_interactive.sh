#!/bin/bash

if [ -z "$1" ]
then
    echo 'use: ./run.sh <PROJ-DIR>'
    exit 1
fi

VERSION=$(cat README.md | grep "Version" | awk '{print $2}')

cd $1

docker run \
    --rm \
    -i \
    -t \
    -v $(pwd):/home \
    -w '/home' \
    mooremachine/ccompiler:$VERSION
