#!/usr/bin/env bash

set -e

import com.encodeering.docker.config
import com.encodeering.docker.docker

patch -p1 --no-backup-if-mismatch --directory=$PROJECT < patch/debian/Dockerfile.patch

docker-pull "$REPOSITORY/debian-$ARCH:stretch" "debian:stretch"

docker build -t "$DOCKER_IMAGE" "$PROJECT"
