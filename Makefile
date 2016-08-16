MACHINE=aws01
machine-create:
	docker-machine create --driver amazonec2 \
  --amazonec2-subnet-id $SUBNET_ID \
  --amazonec2-vpc-id $VPC_ID aws01

start:
	docker-machine start ${MACHINE}
	docker-machine regenerate-certs ${MACHINE}
	#$(docker-machine env $${MACHINE})
	use
stop:
	docker-machine stop ${MACHINE}
use:
	docker-machine use aws01

build:
	docker build --tag dmitrinesterenko/blog\:latest -f Dockerfile-production .

run:
	docker-compose start db
	docker run -it --rm --name blog -p 80\:4000 --link blogphoenix_db_1\:db dmitrinesterenko/blog\:latest

deploy: build
	docker push dmitrinesterenko/blog\:latest
#        use
	docker pull dmitrinesterenko/blog\:latest
	#docker stop dmitrinesterenko/blog\:latest
	docker-compose -f docker-compose-development.yml start db
	docker run -it --rm -p 80\:4000 --link blogphoenix_db_1:db --name blog dmitrinesterenko/blog\:latest

shell:
	docker run -it --rm -p 80\:4000 --link blogphoenix_db_1:db --name blog dmitrinesterenko/blog\:latest /bin/bash

recreatedb: shell
	mix ecto.drop
	mix ecto.create
	mix ecto.migrate

test: build
	docker-compose start db
	docker run -it --rm --name blog -p 80\:4000 -v `pwd`:/webapp/current \
	--link blogphoenix_db_1\:db dmitrinesterenko/blog\:latest mix test
