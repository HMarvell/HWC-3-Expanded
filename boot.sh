#!bin/bash

# Script to allow user input of ACG credentials

echo "Please Enter Access ID:"
read -s varID

echo "Now Please Enter Secret Key:"
read -s varKey

export AZ_ACCESS_KEY=$varID
export AZ_SECRET_KEY=$varKey

docker compose run terraform init