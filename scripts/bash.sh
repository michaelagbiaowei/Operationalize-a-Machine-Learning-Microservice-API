# USING BASH SCRIPT TO AUTOMATE THE EXECUTE DEPLOYMENT SCRIPTS

#!/bin/bash

# Installing dependencies via project Makefile
make install

# Installing Hadolint
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64

sudo chmod +x /bin/hadolint

make lint

# Installing minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube

minikube version

minikube start

minikube kubectl -- get pods -A

# Executing run_docker.sh script
sudo chmod u+x run_docker.sh

sudo ./run_docker.sh
