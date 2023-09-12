#!/bin/sh
echo "MY_ENV_VAR=new_value;\nMY_ENV_VAR_2=new_value2" >/env/myenvfile

echo "Starting temporary server..."
nohup python3 -m http.server 8000 &

sleep 20
pkill -f "python3 -m http.server"