#! /usr/bin/env bash
set -x
set -e

docker run --rm -v /tmp/gradle-caches:/root/.gradle/caches -v /godata/pipelines/$GO_PIPELINE_NAME:/home/gradle -w /home/gradle gradle:3.5-jdk8 gradlew clean test
