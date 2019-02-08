NAME = mercurial_ldap_auth

.PHONY: all build

all: build

PROJECTDIR := $(shell /bin/bash -c pwd)

build:
		CGO_ENABLED=0 go build -a -installsuffix cgo
		docker-compose build
