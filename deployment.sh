#!/bin/bash

###################
#
# Author: Vikash Kumar
#
# Date: 26/07/2023
#
# Version: v1
# 
# This Script will automate the process of deploying dockerized application
#
###################

#Update the system & Installing Docker

sudo apt update
sudo apt install docker.io -y

#Pulling the Docker image

docker pull vikashkumar07/my-node-app

# Running the container to Root URL of Instance IP

docker run -d -p 80:8000 --name node-container vikashkumar07/my-node-app 
