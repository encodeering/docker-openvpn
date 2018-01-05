#!/usr/bin/env bash
# configuration
#   env.ARCH
#   env.PROJECT
#   env.VERSION
#   env.REPOSITORY

set -e

import com.encodeering.docker.config
import com.encodeering.docker.docker

docker-pull "$REPOSITORY/alpine-$ARCH:3.7" "alpine:3.6"

docker build -t "$DOCKER_IMAGE" "$PROJECT"
