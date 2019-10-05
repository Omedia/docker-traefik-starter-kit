#!/usr/bin/env bash

read -p "This will remove ALL docker containers, networks, volumes and images. Are you sure? " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  echo
  exit 0
fi
echo

# stop ALL containers
docker stop $(docker ps -a -q)

# remove ALL containers
docker rm -f $(docker ps -a -q)


docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')
docker volume rm -f $(docker volume ls | grep "bridge" | awk '/ / { print $1 }')

docker rmi -f $(docker images -q)

docker volume ls -qf dangling=true | xargs docker volume rm
