#!/bin/bash

sudo docker run -d -p 9889:80 --name sf-ci-pw11 --mount type=bind,src=/var/lib/jenkins/workspace/sf-ci-pw11/,dst=/usr/share/nginx/html/ nginx
sudo docker ps -a
sudo curl -I http://84.201.159.33:9889 2>/dev/null | head -n 1 | cut -d$' ' -f2
sudo echo -n 'http://84.201.159.33:9889/index.html' | md5sum
sudo docker stop sf-ci-pw11
sudo docker rm sf-ci-pw11
sudo docker ps -a