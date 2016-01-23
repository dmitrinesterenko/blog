#! /bin/bash

npm install
#update Hex
#mix deps.get
#mix local.hex
#mix compile
mix deps.update phoenix_live_reload
mix phoenix.server
/bin/bash

# this line exists if run inside docker-compose
# iex -S mix phoenix.server
