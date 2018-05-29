#!/bin/sh
set -e
v=$1

if [ ! -n "$v" ]; then
　　echo "v is empty"
　　exit 1
fi


cd ~/Documents/java/bruntime
echo "docker build starting..."
cd ~/Documents/java/bruntime/modules
git checkout .
cd ~/Documents/java/bruntime/bundle
git checkout .
cd ../

docker build --no-cache -t icwv.info/cwv/$v -f docker/Dockerfile .
#docker run -d --restart=always -p 8000:8000 --name cwv-raft -e JAVA_OPTS="-Dfile.encoding=UTF8"  icwv.info/cwv/$v

echo "docker build end..."
