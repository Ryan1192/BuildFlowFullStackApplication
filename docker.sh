#!/bin/bash/
docker build -t imcalled/lbg-api:latest . 
docker push imcalled/lbg-api:latest

docker stop lbg-container
docker rm lbg-container
docker run -d -p 8080:8080 --name lbg-container imcalled/lbg-api:latest