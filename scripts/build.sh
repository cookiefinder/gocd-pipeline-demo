#! /usr/bin/env bash
set -x
set -e

docker run --rm -v /tmp/gradle-caches:/home/gradle/.gradle/caches -v $WORKDIR/pipelines/$GO_PIPELINE_NAME:/home/gradle -w /home/gradle -u root gradle:3.5-jdk8 ./gradlew clean build

if [[ -z $DOCKER_REGISRTY ]]; then
  DOCKER_REGISRTY=10.29.5.155:5000
fi

IMAGE_NAME=${DOCKER_REGISRTY}/pipeline-demo:${GO_PIPELINE_COUNTER}

docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME
docker rmi $IMAGE_NAME