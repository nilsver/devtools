#!/bin/bash

ENV_FILE="/usr/local/bin/.env"

echo -e "RED='\033[0;31m'\nGREEN='\033[0;32m'\nBLUE='\033[0;34m'\nNC='\033[0m'" | sudo tee -a "$ENV_FILE" > /dev/null

read -p "Enter USERNAME: " USERNAME
read -p "Enter package directory (leave empty for /mnt/devel/rhel/9): " PACKAGE_DIR
PACKAGE_DIR="${PACKAGE_DIR:-/mnt/devel/rhel/9}"

echo "USERNAME=$USERNAME" >> "$ENV_FILE"
echo "PACKAGE_DIR=$PACKAGE_DIR" >> "$ENV_FILE"

echo "Configuration saved to $ENV_FILE"
