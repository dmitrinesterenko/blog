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
# in case things go wrong with NPM and Node (and stati assets)
# you may benefit from re-installing the whole Node ecosystem
# apt-get install node
# apt-get install nodejs
# apt-get install npm
# another variety of making sure the npm version is the latest
# npm install -g npm
npm install
