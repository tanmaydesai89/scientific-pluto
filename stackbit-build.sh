#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e4a26e4752b9c0019009d1c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e4a26e4752b9c0019009d1c
curl -s -X POST https://api.stackbit.com/project/5e4a26e4752b9c0019009d1c/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e4a26e4752b9c0019009d1c/webhook/build/publish > /dev/null
