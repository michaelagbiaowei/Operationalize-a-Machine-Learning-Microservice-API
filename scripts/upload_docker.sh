#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=maiempire/sklearn

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login -u maiempire
docker tag maiempire/sklearn $dockerpath:latest

# Step 3:
# Push image to a docker repository
docker push maiempire/sklearn:latest