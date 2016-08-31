#!/bin/bash
# This correctly makes a pg_dump of the database onto the host that is running
# one of the current databases
# there should be a mount of something external before this occurs
# or a follow up push to something external
docker exec blogphoenix_db_1 mkdir -p /backup
docker exec blogphoenix_db_1 pg_dump --host=127.0.0.1 --user=phoenix_blog \
  --dbname=phoenix_blog --file=/backup/`date -u +%Y-%m-%d-%H-%M-%S`.bkp.tar --format=t
