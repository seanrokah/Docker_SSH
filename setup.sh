#! /bin/bash

# Usage: ./setup.sh <root_password> <host_port>
ROOT_PASSWORD=${1:-changeme}
SSH_PORT=${2:-2222}

# Export variables for docker-compose
export ROOT_PASSWORD
export SSH_PORT

# Build docker image
docker compose build --no-cache
# Running docker compose
docker compose up -d

# Running ssh
ssh -p $SSH_PORT root@localhost

