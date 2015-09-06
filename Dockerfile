FROM marcelocg/phoenix

#TODO this might not be necessary once you use docker-compose
ENV WORKDIR /my_phoenix
WORKDIR $WORKDIR
ADD . $WORKDIR
# Looks that marcelo's image is missing psql so the default use of Postgres
# is not available. This is smart of the original image because the 
# tools used by Ecto to connect to the DB depend on the 
# DB decision of each phoenix project 
RUN apt-get update && apt-get install -y \
	postgresql-client
EXPOSE 4000
