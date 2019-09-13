#!/bin/bash

#compile, test, package
mvn clean package

# build image
docker build \
    -t eu.gcr.io/fausto-lab/tomcat-simple-site:logging-v1 \
    .

docker push eu.gcr.io/fausto-lab/tomcat-simple-site:logging-v1

kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml