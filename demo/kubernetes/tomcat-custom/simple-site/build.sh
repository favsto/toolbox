#!/bin/bash

#compile, test, package
mvn clean package

# build image
docker build \
    -t eu.gcr.io/fausto-lab/tomcat-simple-site:v1 \
    -t eu.gcr.io/fausto-lab/tomcat-simple-site:latest \
    .
