#! /bin/bash

mix local.hex --force
mix local.rebar --force
mix deps.get -Y
npm install
mix test
