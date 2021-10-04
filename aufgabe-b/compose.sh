#!/bin/bash
set -e
if [ "$#" -lt 2 ]; then
    echo -e\
    "usage info\n\
    build <tagname> <registry>\n\
    example: build latest ssc4033.azurecr.io"
    exit 1
else
    TAG="$1"
    REGISTRY="$2"
fi

# 1. Container build
docker build -t aufgabe_b:$TAG .

# 2. Container tag
docker tag aufgabe_b:$TAG $REGISTRY/ssc-aufgabe_b:latest
docker tag aufgabe_b:$TAG $REGISTRY/ssc-aufgabe_b:$TAG

# 3. Container push registry
docker push $REGISTRY/ssc-aufgabe_b:latest
docker push $REGISTRY/ssc-aufgabe_b:$TAG
