#!/usr/bin/env bash
echo "This is dangerous! Your user must be in the docker group."
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -aq)
docker rm $(docker ps -aq)
