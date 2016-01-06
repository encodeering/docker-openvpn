#!/bin/bash

set -ev

TAG="$REPOSITORY/$PROJECT-$ARCH"
TAGSPECIFIER="$VERSION"

docker pull   "$REPOSITORY/debian-$ARCH:jessie"
docker tag -f "$REPOSITORY/debian-$ARCH:jessie" "debian:jessie"

patch -p0 --no-backup-if-mismatch --directory=$PROJECT < .patch/Dockerfile.patch

docker build -t "$TAG:$TAGSPECIFIER" "$PROJECT"

set +e

docker run --rm "$TAG:$TAGSPECIFIER" openvpn --version | tee .version

grep -qF -- "<sales@openvpn.net>" .version
