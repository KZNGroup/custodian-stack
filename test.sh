#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

pip3 install c7n

custodian validate regional/*.yml
custodian run --dryrun -r all -s out regional/*.yml
