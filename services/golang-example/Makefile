# git checkout .

# git pull origin branch

# go get ...

install-build-tools:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o main main.go
	tar -cvf build.tar main bin/ conf/

build-package: install-build-tools
	make