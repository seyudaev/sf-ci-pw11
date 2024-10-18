#!/bin/bash

docker run -d -p 9889:80 --name ci-cd-pw11 --mount type=bind,src=/var/lib/jenkins/workspace/sf-ci-pw11/,dst=/usr/share/nginx/html/ nginx
docker ps -a
curl -I http://84.201.159.33:9889 2>/dev/null | head -n 1 | cut -d$' ' -f2
echo -n 'http://84.201.159.33:9889/index.html' | md5sum
docker stop sf-ci-pw11
docker rm sf-ci-pw11
docker ps -a