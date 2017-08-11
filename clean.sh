#!/bin/bash

# Kill running containers
docker-compose kill
docker-compose rm -f

# Delete main app container
docker rmi -f myblog_app

# Delete dangling containers / images
docker rm $(docker ps -a -q -f status=exited)
docker rmi -f $(docker images -q -f dangling=true)
docker volume rm -f $(docker volume ls -f dangling=true)

# Delete all images
# docker rmi -f $(docker images myblog_\* -q)

# Delete volumes
# docker volume rm -f $(docker volume ls -q -f name=myblog_\*)

# docker network rm -f myblog_data
