#!/bin/bash

VERSION=$(cat README.md | grep "Version" | awk '{print $2}')

docker build --tag ccompiler:$VERSION .

