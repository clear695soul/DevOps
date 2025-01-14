#!/usr/bin/bash
docker build -t wp-app ./c1
docker build -t wp-database ./c2
bash ./network.sh
docker run -d --name wp-database -v wp-db:/var/lib/mysql wp-database 
docker run -d --name wp-app -v wp-data:/var/www/html --mount type=bind,source=./apache,target=/etc/apache2 wp-app
docker network connect wp-net wp-database
docker network connect wp-net wp-app