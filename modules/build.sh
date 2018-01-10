#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

./build-${BASE}.sh

set +e

docker-verify openvpn --version | tee .version

grep -qF -- "<sales@openvpn.net>" .version
