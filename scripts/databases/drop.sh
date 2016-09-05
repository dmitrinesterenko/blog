#!/bin/bash
HOST=blog01.caagrkhtyghj.us-east-1.rds.amazonaws.com
USER=blog
DATABASE=phoenix_blog
psql -h $HOST \
  --user=$USER \
  --password \
  -c "DROP DATABASE $DATABASE"

