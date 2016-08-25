docker-machine create --driver amazonec2 \
  --amazonec2-subnet-id $SUBNET_ID \
  --amazonec2-vpc-id $VPC_ID aws01

