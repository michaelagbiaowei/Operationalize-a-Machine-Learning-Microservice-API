# USING BASH SCRIPT TO AUTOMATE THE EXECUTE DEPLOYMENT SCRIPTS

#!/bin/bash

# Installing dependencies via project Makefile
make install

# Installing Docker
sudo yum install -y yum-utils

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo 

docker -v

# Installing Hadolint
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64

sudo chmod +x /bin/hadolint

make lint

# Installing minikube
sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube

minikube version

sudo minikube start

sudo minikube kubectl -- get pods -A

# Executing run_docker.sh script
sudo chmod u+x run_docker.sh

sudo ./run_docker.sh

# Making predictions
sudo ./make_prediction.sh
