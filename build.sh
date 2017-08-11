#!/bin/sh

bundle install && \
  cd java_client && ./gradlew installDist
