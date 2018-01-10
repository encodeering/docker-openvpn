#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

patch -p1 --no-backup-if-mismatch --directory=$PROJECT < patch/debian/Dockerfile.patch

docker-pull "$REPOSITORY/debian-$ARCH:stretch" "debian:stretch"

docker-build "$PROJECT"
