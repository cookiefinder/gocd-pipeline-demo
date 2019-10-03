#! /usr/bin/env bash
set -x
set -e

cd /home/gradle && ./gradlew clean build

if [[ -z $DOCKER_REGISRTY ]]; then
  DOCKER_REGISRTY=10.10.2.156:5000
fi

IMAGE_NAME=${DOCKER_REGISRTY}/pipeline-demo:${GO_PIPELINE_COUNTER}

docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME
docker rmi $IMAGE_NAME
