#!/bin/bash
if [ ! -d "/opt/services/" ]; then
   mkdir /opt/services
fi

if [ ! -d "/opt/app/" ]; then
   mkdir /opt/app
fi

if [ ! -d "/opt/bin/" ]; then
   mkdir /opt/bin
fi

cp -r bin/* /opt/bin/.

cp -r services/* /opt/services/.
