#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=abshaheen/prediction_app:v0.1

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run predictionappk8s --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
# kubectl get nodes
echo "waiting for the deployment to be ready ...";
kubectl get deployments

# getting the status for the pod and wait till it is running to run the proxy command
while [ $(kubectl describe pods predictionappk8s | grep ^Status: | head -1 | awk '{print $2}') != 'Running' ]
do
    sleep 1
done

# Step 4:
# Forward the container port to a host
echo -e "\n\n\n[Starting Proxy.\n"; 
# kubectl proxy --proxy-port-range 8000
kubectl port-forward deployment/predictionappk8s 8000:80
