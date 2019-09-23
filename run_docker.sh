#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build --tag prediction_app:0.1  .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
# docker run -it -p 8000:80 --name mypredictionApp prediction_app:0.1 bash
docker run -p 8000:80 --name mypredictionApp prediction_app:0.1