#!/bin/bash

#compile, test, package
mvn clean package

# build image
docker build \
    -t eu.gcr.io/fausto-lab/tomcat-simple-site:logback-v2 \
    .

docker push eu.gcr.io/fausto-lab/tomcat-simple-site:logback-v2

kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
