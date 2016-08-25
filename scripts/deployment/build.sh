#!/bin/bash
eval $(docker-machine env --unset --shell bash)
docker build --tag dmitrinesterenko/blog\:latest -f Dockerfile-production .
