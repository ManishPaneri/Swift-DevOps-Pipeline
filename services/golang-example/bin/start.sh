#!/bin/bash
cd ../
./main >logs/app.txt 2>&1 &
echo $! >pid.file