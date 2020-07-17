#!/usr/bin/env bash

set -eux

source services/.env

scp -r services $DEPLOY_TARGET
