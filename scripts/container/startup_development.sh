#! /bin/bash
./scripts/container/install.sh
MIX_ENV=test iex -S mix phoenix.server
