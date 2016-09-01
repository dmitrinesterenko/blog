MACHINE=aws01
.PHONY: choose
machine-create:
	docker-machine create --driver amazonec2 \
  --amazonec2-subnet-id $(SUBNET_ID) \
  --amazonec2-vpc-id $(VPC_ID) aws01

start:
	docker-machine start ${MACHINE}
	docker-machine regenerate-certs ${MACHINE}
	#$(docker-machine env $${MACHINE})
	choose

stop:
	docker-machine stop ${MACHINE}

base:
	 docker build --tag dmitrinesterenko/blogbase\:latest -f Dockerfile-base .

build:
	./scripts/deployment/build.sh

run:
	docker-compose start db
	docker run -it --rm --name blog -p 80\:4000 --link blogphoenix_db_1\:db dmitrinesterenko/blog\:latest

push:
	./scripts/deployment/push.sh

deploy:
	./scripts/deployment/deploy.sh

shell:
	docker exec -it blog /bin/bash

recreatedb: shell
	mix ecto.drop
	mix ecto.create
	mix ecto.migrate

backup:
	./scripts/databases/backup.sh

test: build
	docker-compose start db
	docker run -it --rm --name blog -p 80\:4000 -v `pwd`:/webapp/current \
	--link blogphoenix_db_1\:db dmitrinesterenko/blog\:latest mix test
