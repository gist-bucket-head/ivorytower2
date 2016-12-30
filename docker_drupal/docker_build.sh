#!/usr/bin/env bash
./pull_ubuntu.sh
docker build --build-arg NEW_PASS=12345 -t 'drupal:cjm1' .