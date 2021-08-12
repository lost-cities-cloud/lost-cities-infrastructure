#!/usr/bin/env bash

WORKSPACE="${HOME}/Workspace"

INFRASTRUCTURE_REPO="git@github.com:lostcities-cloud/lostcities-infrastructure.git"
COMMON_REPO="git@github.com:lostcities-cloud/lostcities-common.git"
ACCOUNTS_REPO="git@github.com:lostcities-cloud/lostcities-accounts.git"
MATCHES_REPO="git@github.com:lostcities-cloud/lostcities-matches.git"
EXPERIENCE_REPO="git@github.com:lostcities-cloud/lostcities-web-experience.git"



mkdir -p "$WORKSPACE"

cd "$WORKSPACE" || exit

git clone $INFRASTRUCTURE_REPO
git clone $EXPERIENCE_REPO
git clone $ACCOUNTS_REPO
git clone $MATCHES_REPO
git clone $COMMON_REPO