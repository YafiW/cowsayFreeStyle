#!/bin/bash

# Wait for 10 seconds
sleep 10

# Check the HTTP status code
response=$(curl -o /dev/null -s -w "%{http_code}\n" http://cowsay_container11:8080)

# Compare the response code
if [ "$response" -ne 200 ]; then
    echo "Test failed with response code $response"
    docker logs cowsay_container
    exit 1
else
    echo "Test succeeded with response code $response"
fi
