#!/usr/bin/env bash

docker run -ti -v `pwd`:/content -p 8080:8080 \
  -e CONTENT_URL_PREFIX="file:///content" \
  docker.io/osevg/workshopper
