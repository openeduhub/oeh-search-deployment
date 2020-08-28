#!/usr/bin/env bash

set -e

docker-compose pull
docker-compose up -d --no-deps frontend elasticsearch-relay
