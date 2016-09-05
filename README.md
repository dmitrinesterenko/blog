# Blog

This is a blog engine that uses the Phoenix framework

# Running

```sh
docker-compose up
```
This will run the application.

Now you can visit `localhost:4000` in your browser.

# Database
A shorthand for database console psql command is in
```sh
./scripts/databases/console.sh
```

## Backup
Make a backup by connecting to docker-machine and running `make backup`

```sh
eval $(docker-machine env {node})
make backup
```

## Restore
Restore from a local dump file

```sh
./scripts/databases/restore.sh ./backup/backup-file.bkp.tar
```
The restore is a full database re-create so you may need to drop the database
beforehand.

```sh
./scripts/databases/drop.sh
```

# Developing

## Running tests
```sh
docker-compose up -f docker-compose-test.yml up
```

## Debugging

With two shell windows open.

In the first one run the command to start the container in development mode.
```sh
./scripts/host/development.sh
```
In the second window or pane find the ID of the apps container:
```sh
CONTAINER=$(docker ps -q | grep app)
docker exec -it $CONTAINER /bin/bash
iex -S mix test # will run the tests IEx attached
```
Visit the [Wiki on
Debugging](https://github.com/dmitrinesterenko/blog/wiki/Debugging) for
additional notes

# Deploying

## Docker Machine
Check the scripts and Makefile in ./scripts/deployment

Create a new aws01 node
```
SUBNET=your_subnet VPC_ID=vpc_id make create
```

To deploy your application on an existing aws01 node run
```sh
make deploy
```
