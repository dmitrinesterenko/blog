#!/bin/bash
eval $(docker-machine env --unset --shell bash)
docker build --tag dmitrinesterenko/blogbase\:latest -f Dockerfile-base .
