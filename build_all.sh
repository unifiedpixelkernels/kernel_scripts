#!/bin/bash

ROOT="$(cd "$(dirname "$(realpath "$0")")";pwd -P)/../"

codenames=( coral sunfish redbull barbet raviole )

time for i in "${codenames[@]}"
do
    $ROOT/build.sh $i
done
