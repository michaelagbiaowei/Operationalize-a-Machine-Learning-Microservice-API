#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=maiempire/sklearn

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run sklearn-model-api --image=${dockerpath}:latest

# Step 3:
# List kubernetes pods
minikube kubectl -- get pods -A

# Step 4:
# Forward the container port to a host
# kubectl port-forward sklearn-model-api 8000:80
kubectl port-forward pod/sklearn-model-api --address 0.0.0.0 8000:80
