#!/bin/bash


CONTAINERNAME=`docker ps | egrep 'availj/avail' | awk '{print $1}'`

wget -O entrypoint.sh https://raw.githubusercontent.com/KenSukiVN/avail/main/entrypoint.sh

docker  cp entrypoint.sh ${CONTAINERNAME}:/entrypoint.sh

docker restart ${CONTAINERNAME}

docker logs -f --tail 100 ${CONTAINERNAME}
