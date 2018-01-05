#!/usr/bin/env bash
# configuration
#   env.ARCH
#   env.PROJECT
#   env.VERSION
#   env.REPOSITORY

set -e

import com.encodeering.docker.config
import com.encodeering.docker.docker

docker-pull "$REPOSITORY/debian-$ARCH:stretch" "debian:stretch"

patch -p0 --no-backup-if-mismatch --directory=$PROJECT < patch/Dockerfile.patch

docker build -t "$DOCKER_IMAGE" "$PROJECT"

set +e

docker run --rm "$DOCKER_IMAGE" openvpn --version | tee .version

grep -qF -- "<sales@openvpn.net>" .version
