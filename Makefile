SHELL := /bin/bash

default:

.PHONY: start
start:
	./bin/start.sh

.PHONY: stop
stop:
	./bin/stop.sh

.PHONY: remove
remove:
	./bin/remove.sh

.PHONY: build
build:
	./bin/build.sh

.PHONY: restart
restart:
	./bin/restart.sh

.PHONY: reset
reset:
	./bin/reset.sh

.PHONY: fix-hosts
fix-hosts:
	./bin/fix-hosts.sh
