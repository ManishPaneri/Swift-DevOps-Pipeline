#!/bin/bash
serviceName=$1

if [ -z "$serviceName"  ]; then
   echo -e "No argument."
   echo -e "missing service name parameter. \n$ release.sh {{service name}}"
   exit 1;
fi

if [ ! -d "/opt/app/backup/" ]; then
   mkdir /opt/app/backup
fi

if [ ! -d "/opt/app/backup/$serviceName/" ]; then
   mkdir /opt/app/backup/$serviceName
   mkdir /opt/app/backup/$serviceName/logs
fi

if [ ! -d "/opt/app/$serviceName/" ]; then
   mkdir /opt/app/$serviceName
fi

if [ ! -z "$(ls -A /opt/app/$serviceName/)" ]; then
	cp -r /opt/app/$serviceName/.  /opt/app/backup/$serviceName/
fi

mv /opt/build/$serviceName/build.tar /opt/app/$serviceName/

cd /opt/app/$serviceName/

tar -xvf build.tar

if [ -d "build/" ]; then
   cp -r build/* .
fi

cd /opt/app/$serviceName/bin

if [ -f "/opt/app/$serviceName/pid.file" ] && [ ! -p $(cat "/opt/app/$serviceName/pid.file") > /dev/null ]; then
	bash stop.sh
fi

if [ ! -d "/opt/app/$serviceName/logs" ]; then
   mkdir /opt/app/$serviceName/logs
fi

if [ ! -z "$(ls -A /opt/app/backup/$serviceName/logs/)" ]; then
	mv /opt/app/backup/$serviceName/logs/* /opt/app/$serviceName/logs/
fi

if [ -d "/opt/app/$serviceName/build/" ]; then
   cp  -r /opt/app/$serviceName/build/* /opt/app/$serviceName/.
fi

rm -r /opt/app/$serviceName/build*

cd /opt/app/$serviceName/bin

bash start.sh

ps -p $(cat "/opt/app/$serviceName/pid.file")