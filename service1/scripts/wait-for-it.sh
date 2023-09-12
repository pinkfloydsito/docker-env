#!/bin/bash

HOST_PORT="$1"
RETRIES=20
DELAY=1

if [ -z "$HOST_PORT" ]; then
    echo "Error: HOST:PORT argument not provided"
    exit 1
fi

echo "Waiting for server on $HOST_PORT to become available..."

count=0
while [ $count -lt $RETRIES ]
do
    nc -z -w 1 $(echo $HOST_PORT | awk -F: '{print $1}') $(echo $HOST_PORT | awk -F: '{print $2}') && break
    count=$((count + 1))
    echo "Server not available yet. Retrying ($count/$RETRIES)..."
    sleep $DELAY
done

if [ $count -eq $RETRIES ]; then
    echo "Server did not become available after $RETRIES attempts. Exiting."
    exit 1
else
    echo "Server is available!"
    if [ "$#" -gt 2 ]; then
        "${@:3}"
    fi
fi