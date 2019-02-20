#!/bin/bash

echo "This will reinit the db, create ssl keys, and start the api"

PLATFORM_DIRECTORY=$(pwd)

sudo systemctl restart postgresql


cd "$PLATFORM_DIRECTORY"

cd apps/db

mix ecto.reset

cd "$PLATFORM_DIRECTORY"

cd apps/api

rm priv/server.key
rm priv/server.pem

openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=127.0.0.1" -keyout priv/server.key -out priv/server.pem

cd "$PLATFORM_DIRECTORY"

iex -S mix phx.server
