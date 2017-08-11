#!/bin/bash

rm -f ./tmp/pids/server.pid

docker-compose kill
docker-compose rm -f
docker-compose up --build
