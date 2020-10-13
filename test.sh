#!/bin/bash

if [ -z "$1" ]
then
    echo 'use: ./test.sh sample-c-files'
    exit 1
fi

VERSION=$(cat README.md | grep "Version" | awk '{print $2}')

cd $1

echo "Running new container..."

CONTAINER_ID=$(docker run \
    --name ccompiler_test \
    --rm \
    -i \
    -t \
    -d \
    -v $(pwd):/home \
    mooremachine/ccompiler:$VERSION)

echo "Executing command..."

docker exec \
    -w '/home' \
    ccompiler_test \
    sh -c 'make && ./build/hello'

echo "Stopping container..."

docker container stop -t 0 $CONTAINER_ID
