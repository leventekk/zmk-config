#!/usr/bin/env bash

set -eu

PWD=$(pwd)
TIMESTAMP="${TIMESTAMP:-$(date -u +"%Y%m%d%H%M")}"
COMMIT="${COMMIT:-$(echo xxxxxx)}"

west build -s zmk/app -d build/left -b nice_nano_v2 -- -DZMK_CONFIG="${PWD}/config" -DSHIELD=corne_left
west build -s zmk/app -d build/right -b nice_nano_v2 -- -DZMK_CONFIG="${PWD}/config" -DSHIELD=corne_right

cp build/left/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}-${COMMIT}-left.uf2" && cp build/right/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}-${COMMIT}-right.uf2"
