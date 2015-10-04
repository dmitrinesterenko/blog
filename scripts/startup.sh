#! /bin/bash

npm install
mix deps.get 
mix test 
# With iex this is debug mode
iex -S mix phoenix.server
