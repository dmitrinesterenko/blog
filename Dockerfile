FROM marcelocg/phoenix:latest

#TODO this is not necessary once you use docker-compose
#ENV WORKDIR /my_phoenix
#iWORKDIR $WORKDIR
#ADD . $WORKDIR
RUN apt-get update
# Looks that marcelo's image is missing psql so the default use of Postgres
# is not available. This is smart of the original image because the
# tools used by Ecto to connect to the DB depend on the
# DB decision of each phoenix project
RUN apt-get install -y postgresql-client
# Update to 1.1 of elixir
RUN apt-get install -y elixir
EXPOSE 4000
