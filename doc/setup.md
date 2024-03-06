Tools for building, executing, and tuning single-node concurrent software pipeline.

### How to set up pipeline
Setup script helps to create the required directories and files on the VM instance.

```sh
bash setup.sh
```

To create directories in the `/opt/` folder. 
- It includes a `/opt/bin` folder for executing scripts for build and release services,
- The `/opt/build` directory,manages the project build (`build.tar`). If there are multiple instances (servers), this path `/opt/build/` can be used as a single mount point. 
- The `/opt/app` folder is used to execute the build and manage application logs.

![Swift-DevOps-Pipeline](https://github.com/ManishPaneri/Swift-DevOps-Pipeline/assets/22714758/53774688-591d-42ae-b2c1-3397504f039d)


### Project Makefile
Creating a Makefile involves defining a set of rules and instructions for building and managing your service. Here's simple Makefile example:
````
install-build-tools:
       # Write a shell script to build file
       
build-package: install-build-tools
	make
        
````
There are a few examples mentioned in the services folder in the project where Makefile is available in an easy-to-understand format.


### Pre-Installation
To get the language support for required project build creation and release support,refer `pre-install` folder where `install.sh` file is available. You will need to add a bash command to pre-install for required project support. 
```sh 
 bash /opt/bin/pre-install/install.sh 
```







