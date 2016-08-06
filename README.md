# Blog

This is a blog engine that uses the Phoenix framework

# Running

```sh
docker-compose up
```
This will run the application.

Now you can visit `localhost:4000` in your browser.

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
