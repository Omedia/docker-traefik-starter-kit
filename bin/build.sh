#!/usr/bin/env bash

./bin/remove.sh
docker-compose up --build --remove-orphans -d

make fix-hosts
