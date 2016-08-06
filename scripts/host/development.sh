#!/bin/bash
# docker-compose -f docker-compose-development.yml up

# This is a workaround for the fact that running iex -S mix phoenix.server as the
# last instruction in the "command" script in the docker-compose YML file has the
# container quitting after it starts up.
# I suspect that iex -S may delegate the mix phoenix.server to one process and
# then it sends an exit code as a result of this making docker-compose
# believe that the command had finished executing
docker-compose -f docker-compose-development.yml start db
docker run -it -p 4000:4000 --link blogphoenix_db_1:db -v $(pwd):/code app \
  /code/scripts/container/startup_development.sh


