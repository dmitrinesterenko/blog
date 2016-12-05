#!/bin/bash
HOST=54.225.13.119     #blog01.caagrkhtyghj.us-east-1.rds.amazonaws.com
USER=phoenix_blog      #blog
DATABASE=phoenix_blog
BACKUP=$1 #./backup/2016-09-01-02-49-58.bkp.tar

# This correctly makes a pg_dump of the database onto the host that is running
# one of the current databases
# there should be a mount of something external before this occurs
# or a follow up push to something external
# eval $(docker-machine env aws01)
psql -h $HOST \
  --user=$USER \
  --password \
  -c "CREATE DATABASE $DATABASE"

pg_restore --host $HOST \
  --dbname $DATABASE \
  --verbose --username $USER \
  --password \
  --format t \
  --no-owner \
  $BACKUP
#docker exec blogphoenix_db_1 pg_restore --host=$HOST
#  --user=$USER
#  --password \
#  --format=t backup/2016-09-01-02-49-58.bkp.tar
