#!/bin/bash
set -e

password=$(python -c 'import uuid; print(uuid.uuid4())')

aws cognito-idp admin-create-user \
    --user-pool-id "${USER_POOL_ID}" \
    --username "${ROBOT_USERNAME}" \
    --user-attributes Name=email,Value="${ROBOT_EMAIL}" \
    --message-action SUPPRESS

aws cognito-idp admin-set-user-password \
    --user-pool-id "${USER_POOL_ID}" \
    --username "${ROBOT_USERNAME}" \
    --password "${password}" \
    --permanent

echo "${ENV_NAME},${USER_POOL_ID},${ROBOT_USERNAME},${password}" >/work/creds.${ENV_NAME}
