#!/bin/bash

if [ "$1" != "" ]; then
  ENV=$1
else
  ENV="dev"
fi
echo 'Executing for environment...'
echo $ENV

java -Xms512m -Xmx512m -Xss10m -XX:NewSize=100m -XX:MaxMetaspaceSize=512m -XX:CMSInitiatingOccupancyFraction=75 -XX:SurvivorRatio=6 -XX:+UseConcMarkSweepGC -server -Xloggc:../logs/gc.log -verbose:gc -XX:+PrintGCDetails -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=../logs -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=FALSE -Dcom.sun.management.jmxremote.authenticate=FALSE -Dlogging.config=../config/env/$ENV/log4j2.xml -Dlog4j2.contextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector -Dspring.profiles.active=$ENV -Dspring.config.location=../config/env/$ENV/application.properties,../config/env/$ENV/server.properties -jar ../lib/test-*.jar >../logs/app.stdout 2>&1 &
echo $! >../pid.file
