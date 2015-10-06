#! /bin/bash

npm install
mix deps.get 
mix test
mix phoenix.server
