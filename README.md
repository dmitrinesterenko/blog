# Blog

This is a blog engine that uses the Phoenix framework

# Running

```sh
docker-compose up
```

Depending on the command in the app section of the docker-compose.yml this will 
either run the application or run the tests. 

Now you can visit `localhost:4000` from your browser.

# Developing

## Debugging

Scenario: You want to try something
out on the interactive elixir console Iex with this project loaded. 
```sh
user@host $ docker run -it blogphoenix_app /bin/bash
root@container_id:/my_phoenix# 
# now run the interactive elixir console
root@container_id:/my_phoenix# iex -S mix phoenix.server 
```

Scenario: You want to enable Iex for Iex.pry inside your code
```sh
user@host $ iex -S mix phoenix.server
```
