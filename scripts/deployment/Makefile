machine-create: docker-machine create --driver amazonec2 \
  --amazonec2-subnet-id $SUBNET_ID \
  --amazonec2-vpc-id $VPC_ID aws01

use: eval "$(docker-machine env aws01)"

build: docker build --tag dmitrinesterenko/blog:latest -f Dockerfile-production .

deploy: build
  docker push dmitrinesterenko/blog:latest
  docker use aws01
  docker pull dmitrinesterenko/blog:latest
  docker run -it -p 4000:4000 -v $(pwd):/code dmitrinesterenko/blog:latest \
  mix phoenix.server

