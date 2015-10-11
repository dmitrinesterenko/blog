#! /bin/bash

npm install
#update Hex
#mix local.hex
mix deps.get 
#mix phoenix.server
iex -S mix phoenix.server
