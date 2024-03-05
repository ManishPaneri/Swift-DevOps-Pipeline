#!/bin/bash
serviceName=$1

if [ -z "$serviceName"  ]; then
   echo -e "missing service name parameter. \n$ release.sh <service name>"
   exit;
fi

if [ ! -d "/opt/app/backup/" ]; then
   echo "missing backup directory"
   exit;
fi

if [ ! -d "/opt/app/backup/$serviceName/" ]; then
   echo "missing $serviceName directory"
   exit;
fi

if [ -f "/opt/app/$serviceName/pid.file" ] && [ ! -p $(cat "/opt/app/$serviceName/pid.file") > /dev/null ]; then
	cd /opt/app/$serviceName/bin/
	bash stop.sh
fi

if [ ! -z "$(ls -A /opt/app/$serviceName/logs/)" ]; then
	mv /opt/app/$serviceName/logs/* /opt/app/backup/$serviceName/logs/
fi

rm -r /opt/app/$serviceName/

cp -r /opt/app/backup/$serviceName  /opt/app/$serviceName

cd /opt/app/$serviceName/bin

bash start.sh

ps -p $(cat "/opt/app/$serviceName/pid.file")
