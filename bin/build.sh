#!/usr/bin/env bash

. common.properties

cd "$INFRASTRUCTURE_ROOT" || exit

docker-compose --env-file environments/.env."${ENV}" build --parallel \
    --build-arg actor="${LOCAL_GITHUB_ACTOR}" \
    --build-arg token="${LOCAL_GITHUB_TOKEN}" "$@"