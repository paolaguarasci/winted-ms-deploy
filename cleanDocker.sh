#!/bin/bash

containerList=`sudo docker ps -a | grep -v portainer | grep -v NAMES | awk '{ print $1 }'`
sudo docker stop $containerList
sudo docker rm $containerList

imageList=`sudo docker image ls -a | grep -v portainer | grep -v REPOSITORY | awk '{ print $1 }'`
sudo docker image rm $imageList

volumeList=`sudo docker volume ls | grep -v portainer | grep -v DRIVER | awk '{ print $2 }'`
sudo docker volume rm $volumeList

sudo docker network rm be_spring-cloud-network


sudo docker system prune -af