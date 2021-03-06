#!/bin/bash

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region $AWS_DEFAULT_REGION

pushd frontend
amplify checkout env $ENV_NAME
export USER_POOL_ID=$(cat /work/frontend/src/aws-exports.js | grep aws_user_pools_id | cut -d'"' -f4)
popd

pushd backend
export REACT_APP_API_URL=$(sls info --stage $ENV_NAME --verbose 2>&1 | grep ServiceEndpoint | tr -s ' ' | cut -d' ' -f3)
popd

printenv
