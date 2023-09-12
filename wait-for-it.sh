#!/bin/bash

set -e

host="$1"
shift

cmd="$@"

until docker-compose ps | grep $host | grep "(healthy)"; do
	echo >&2 "$host is unavailable - sleeping"
	sleep 5
done

echo >&2 "$host is up - executing command"
exec $cmd
