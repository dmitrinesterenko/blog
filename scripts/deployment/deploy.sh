#!/bin/bash
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_MACHINE_NAME
unset DOCKER_CERT_PATH
# build locally
./scripts/deployment/build.sh
# push
./scripts/deployment/push.sh
# choose node
eval $(docker-machine env aws01 --shell bash)
# deploy
docker pull dmitrinesterenko/blog\:latest
# run
docker-compose -f docker-compose-development.yml start db
docker stop blog
docker rm blog
docker run -d -p 80\:4000 -e "PORT=4000" -e "MIX_ENV=prod" --link blogphoenix_db_1:db --name blog dmitrinesterenko/blog\:latest




