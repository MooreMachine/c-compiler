#!/bin/bash

VERSION=$(cat README.md | grep "Version" | awk '{print $2}')
OLD_VERSION=$VERSION

CHANGED=$(git diff --name-only Dockerfile)

if [ ! -z ${CHANGED} ]
then
    printf 'Please update the version number.\nCurrent version: %s\n' "$VERSION"
    read -p "New version: " NEW_VERSION
    if [ ! -z ${NEW_VERSION} ]
    then
        if [[ ! $NEW_VERSION =~ [0-9]+\.[0-9]+\.[0-9]+ ]]
        then
            echo "Please provide a version number in the form of MAJOR.MINOR.PATCH"
            exit 1
        fi
    else
        echo "Please provide a version number"
        exit 1
    fi
    VERSION=$NEW_VERSION
fi

docker build --tag mooremachine/ccompiler:$VERSION .

if [ $? -ne 0 ]
then
    echo "docker build failed!"
    exit 1
fi

SIZE=$(docker image ls --format "{{.Repository}} {{.Tag}} {{.Size}}" | grep ccompiler | grep $VERSION | awk '{print $3}')

sed -i '' 's/Version: '"$OLD_VERSION"'/Version: '"$VERSION"'/g' README.md
sed -i '' "s/Image size: .*/Image size: $SIZE/g" README.md
