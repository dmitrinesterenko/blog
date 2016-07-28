#! /bin/bash

npm install
mix local.hex --force
mix deps.get
mix test
mix phoenix.server
