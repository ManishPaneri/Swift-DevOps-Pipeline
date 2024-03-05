# git checkout .

# git pull origin branch


install-build-tools:
	mvn clean install -DskipTests
	mv target/build*.tar build.tar

build-package: install-build-tools
	make
