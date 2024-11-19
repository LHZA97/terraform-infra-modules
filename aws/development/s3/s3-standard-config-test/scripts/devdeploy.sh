#!/bin/bash

# Running script from root directory, cd aws directory then run ./env/development/scripts/devdeploy.sh
terraform init $1 --reconfigure -backend-config=../../config/backend.conf &&
terraform validate &&
terraform apply 

# -var-file=./config/uat/env.tfvars