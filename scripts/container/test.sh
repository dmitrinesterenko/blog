#! /bin/bash
./scripts/container/install.sh
mix ecto.create
mix test
