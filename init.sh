#!/usr/bin/env bash

WORKSPACE="${HOME}/Workspace"

INFRASTRUCTURE_REPO="git@github.com:lostcities-cloud/lostcities-infrastructure.git"
COMMON_REPO="git@github.com:lostcities-cloud/lostcities-common.git"
EXPERIENCE_REPO="git@github.com:lostcities-cloud/lostcities-web-experience.git"

mkdir "$WORKSPACE"

cd "$WORKSPACE" || exit

git clone $INFRASTRUCTURE_REPO
git clone $EXPERIENCE_REPO
git clone $COMMON_REPO

