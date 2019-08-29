#! /usr/bin/env bash
set -x
set -e

docker run --rm -v /tmp/gradle-caches:/home/gradle/.gradle/caches -v $WORKDIR/pipelines/$GO_PIPELINE_NAME:/home/gradle -w /home/gradle -u root gradle:3.5-jdk8 ./gradlew     clean test
