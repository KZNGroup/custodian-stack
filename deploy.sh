#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

pip3 install c7n c7n-mailer

cat << EOF > mailer.yml
queue_url: $TRANSPORT_QUEUE_URL
role: $MAILER_ROLE_ARN
region: $MAILER_REGION
EOF

c7n-mailer --config mailer.yml --update-lambda

sed -i -e "s|TransportQueueUrl|$TRANSPORT_QUEUE_URL|g" regional/*.yml
sed -i -e "s|CustodianRoleArn|$POLICY_ROLE_ARN|g" regional/*.yml
sed -i -e "s|SlackWebHookUrl|$SLACK_WEBHOOK_URL|g" regional/*.yml

custodian run -s out -r all regional/*.yml
