#!/bin/bash
serviceName=$1
###
# Validation 
###
if [ -z "$serviceName"  ]; then
   echo -e "No argument."
   echo -e "missing service name parameter. \n$ build.sh {{service name}}"
   exit 1;
fi

if [ ! -d "/opt/services/$serviceName/" ]; then
   echo "unable to find service $serviceName"
   exit 1;
fi

cd ../services/$serviceName/

if [ ! -f "/opt/services/$serviceName/Makefile" ]; then
   echo "missing Makefile file operand"
   echo "Try create Makefile using example url"
   exit 1;
fi

make

if [ ! -f "/opt/services/$serviceName/build.tar" ]; then
	echo "missing build file"
   exit 1;
fi

# push the build.tar file in mount location to take a release latest build
if [ ! -d "/opt/build/" ]; then
   mkdir /opt/build
fi

if [ ! -d "/opt/build/$serviceName" ]; then
   mkdir /opt/build/$serviceName
fi

mv build.tar /opt/build/$serviceName/.

echo "/opt/build/$serviceName/build.tar"