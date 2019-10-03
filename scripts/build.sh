#! /usr/bin/env bash
set -x
set -e

docker run --rm -v /tmp/gradle:/home/gradle/.gradle -v $WORKDIR/pipelines/$GO_PIPELINE_NAME:/home/gradle -w /home/gradle gradle:4.4-jdk8 ./gradlew clean build

if [[ -z $DOCKER_REGISRTY ]]; then
  DOCKER_REGISRTY=10.10.2.156:5000
fi

IMAGE_NAME=${DOCKER_REGISRTY}/pipeline-demo:${GO_PIPELINE_COUNTER}

docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME
docker rmi $IMAGE_NAME
