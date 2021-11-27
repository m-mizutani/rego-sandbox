all: build

CODE_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

build: lambda/*.go
	env GOARCH=amd64 GOOS=linux go build -o $(CODE_DIR)/build/main ./lambda/

asset:
	cp $(CODE_DIR)/build/* /asset-output
