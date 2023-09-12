#!/bin/sh

if [ -f /env/myenvfile ]; then
	source /env/myenvfile
fi

exec "$@"

echo "The environment variable MY_ENV_VAR is: $MY_ENV_VAR"
echo "The environment variable MY_ENV_VAR_2 is: $MY_ENV_VAR_2"
