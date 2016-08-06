#! /bin/bash
#update Hex for dev dockerfile
mix local.hex --force
mix local.rebar --force
mix deps.get -Y
mix deps.clean connection
mix deps.clean db_connection
mix deps.clean postgrex
mix deps.update --all # phoenix_live_reload
mix compile
npm install
npm install node-sass
