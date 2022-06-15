#!/bin/bash

set -o errexit -o pipefail

[[ $# -eq 1 ]] || exit 1

export CODENAME=$(echo "$1" | tr '[:upper:]' '[:lower:]')

if [[ $CODENAME != coral && $CODENAME != sunfish && $CODENAME != redbull && $CODENAME != barbet && $CODENAME != raviole ]]; then
    echo Invalid codename
    exit 1
fi

ROOT="$(dirname "$(realpath "$0")")/../"

coral="BUILD_CONFIG=coral/private/msm-google/build.config.floral build/build.sh"
sunfish="BUILD_CONFIG=coral/private/msm-google/build.config.sunfish build/build.sh"
redbull="BUILD_CONFIG=redbull/private/msm-google/build.config.redbull.vintf build/build.sh"
barbet="BUILD_CONFIG=barbet/private/msm-google/build.config.redbull.vintf build/build.sh"
raviole="LTO=full BUILD_KERNEL=1 raviole/private/gs-google/build_slider.sh"

export OUT_DIR="${ROOT}/out/${CODENAME}-outputs"

chrt -bp 0 $$

pushd "${ROOT}"
eval ${!CODENAME}
popd
