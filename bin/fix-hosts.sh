#!/usr/bin/env bash

traefik_ip=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sharemac.reverse-proxy)
containers=$(docker run -v "$(pwd)/run-scripts/fix-hosts:/var/app" -v "$(pwd)/docker-compose.yml:/var/docker-compose.yml:ro" ruby:2.6-alpine ruby /var/app/get-container-names.rb)
hosts=$(docker run -v "$(pwd)/run-scripts/fix-hosts:/var/app" -v "$(pwd)/docker-compose.yml:/var/docker-compose.yml:ro" ruby:2.6-alpine ruby /var/app/get-hosts.rb)

escaped_ip=$(echo "$traefik_ip" | sed 's/\./\\\./g')
command_sed="sed \"s/^$escaped_ip/# $traefik_ip/g\" /etc/hosts"
command_sed="echo \"\$($command_sed)\" > /etc/hosts"
command_append="echo -e \"$traefik_ip\t$hosts\" >> /etc/hosts"

echo "$containers" | xargs -I {} docker exec --user root "{}" bash -c "$command_sed"
echo "$containers" | xargs -I {} docker exec --user root "{}" bash -c "$command_append"
