#!/bin/sh

if [ -f /env/myenvfile ]; then
	source /env/myenvfile
fi

exec "$@"
