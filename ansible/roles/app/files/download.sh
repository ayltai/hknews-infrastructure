#!/bin/bash

wget $(curl https://circleci.com/api/v1.1/project/github/ayltai/hknews-backend/latest/artifacts?circle-token=${CIRCLECI_TOKEN} | jq -r '.[0].url')
