#! /bin/bash

npm install
mix deps.get 
iex -S mix phoenix.server
