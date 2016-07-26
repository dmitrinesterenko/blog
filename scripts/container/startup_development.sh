#! /bin/bash

#update Hex
mix local.hex --force
mix local.rebar --force
mix deps.get -Y
mix deps.update phoenix_live_reload
npm install
npm install node-sass
mix compile
mix phoenix.server
/bin/bash

# this line exists if run inside docker-compose
# iex -S mix phoenix.server
