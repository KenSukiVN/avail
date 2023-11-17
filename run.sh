#!/bin/bash


CONTAINER_ID=`docker ps | egrep 'availj/avail' | awk '{print $1}'`

docker rename CONTAINER_ID avail

wget -O entrypoint.sh https://raw.githubusercontent.com/KenSukiVN/avail/main/entrypoint.sh
chmod +x entrypoint.sh

docker  cp entrypoint.sh ${CONTAINER_ID}:/entrypoint.sh

docker restart avail

docker logs -f --tail 100 avail
