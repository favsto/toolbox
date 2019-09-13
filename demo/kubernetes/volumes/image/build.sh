#!/bin/bash

# build image
docker build \
    -t eu.gcr.io/fausto-lab/simple-node-site:v1 \
    -t eu.gcr.io/fausto-lab/simple-node-site:latest \
    .
