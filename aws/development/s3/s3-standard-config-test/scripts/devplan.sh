#!/bin/bash

# Running script from root directory, cd aws directory then run ./env/development/scripts/devdeploy.sh

terraform init -reconfigure -backend-config="../../config/backend.conf" &&
terraform plan 

# -var-file=./config/$1/env.tfvars -out tf.plan