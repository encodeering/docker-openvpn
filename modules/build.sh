#!/usr/bin/env bash

set -e

import com.encodeering.docker.config
import com.encodeering.docker.docker

./build-${BASE}.sh

set +e

docker run --rm "$DOCKER_IMAGE" openvpn --version | tee .version

grep -qF -- "<sales@openvpn.net>" .version
