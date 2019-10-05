# docker-traefik-starter-kit


## Available commands

- `make build`
Builds (or rebuilds) containers.

- `make start`
Starts containers.

- `make stop`
Stops containers.

- `make restart`
Restarts containers.

- `make remove`
Removes containers.

- `make reset`
Removes all docker containers, networks, volumes and images.

- `make fix-hosts`
Updates the hosts file in all needed containers in a way that enables cross-container communication with the traefik configuration.
