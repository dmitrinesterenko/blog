MACHINE=aws01
machine-create:
	docker-machine create --driver amazonec2 \
  --amazonec2-subnet-id $SUBNET_ID \
  --amazonec2-vpc-id $VPC_ID aws01

start:
	docker-machine start ${MACHINE}
	$(docker-machine env $${MACHINE})
	docker-machine regenerate-certs ${MACHINE}
stop:
	docker-machine stop ${MACHINE}
use:
	docker-machine use aws01

build:
	docker build --tag dmitrinesterenko/blog:latest -f Dockerfile-production .

deploy: build
	docker push dmitrinesterenko/blog\:latest
#        use
	docker pull dmitrinesterenko/blog\:latest
	#docker stop dmitrinesterenko/blog\:latest
	docker-compose -f docker-compose-development.yml start db
	docker run -it -p 4000\:4000 --link blogphoenix_db_1:db dmitrinesterenko/blog\:latest mix phoenix.server
