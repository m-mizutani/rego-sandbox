all: build

build: lambda/*.go lambda/policy/*.rego
	env GOARCH=amd64 GOOS=linux go build -o build/main ./lambda/
