#!/bin/bash
cd ../
flask run >logs/app.txt 2>&1 &
echo $! >pid.file