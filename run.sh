#!/bin/bash

echo "This will reinit the db, create ssl keys and the main website"

PLATFORM_DIRECTORY=$(pwd)

sudo systemctl restart postgresql


cd "$PLATFORM_DIRECTORY"

cd apps/db

mix ecto.reset

cd "$PLATFORM_DIRECTORY"

iex -S mix phx.server
