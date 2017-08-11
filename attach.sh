#!/bin/bash

docker exec -it $(docker ps -q -f name=myblog_app_\*) /bin/sh
