echo "Deprecated. Use docker-compose up"
docker run -it -p 4000:4000  -v $(pwd):/my_phoenix blogphoenix_app ./scripts/startup.sh
