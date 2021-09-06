#!/usr/bin/env bash

WORKSPACE_ROOT=~/Workspace
INFRASTRUCTURE_ROOT=${WORKSPACE_ROOT}/lostcities-infrastructure

INFRASTRUCTURE_REPO="git@github.com:lostcities-cloud/lostcities-infrastructure.git"
COMMON_REPO="git@github.com:lostcities-cloud/lostcities-common.git"
ACCOUNTS_REPO="git@github.com:lostcities-cloud/lostcities-accounts.git"
MATCHES_REPO="git@github.com:lostcities-cloud/lostcities-matches.git"
FRONTEND_REPO="git@github.com:lostcities-cloud/lostcities-frontend.git"
EXPERIENCE_REPO="git@github.com:lostcities-cloud/lostcities-web-experience.git"
ENV="dev"
LOCAL_GITHUB_ACTOR=${GITHUB_ACTOR}
LOCAL_GITHUB_TOKEN=${GITHUB_TOKEN}

workspaceRootError="Unable to find WORKSPACE_ROOT"

function help() {
   echo "lostcities - Help"
   echo
   echo "Syntax: lostcities [-e :env|-h] commands"
   echo "options:"
   echo "e     Set the environment. Default=$ENV."
   echo "h     Print this Help."
   echo " "
   echo "commands:"
   echo " "
   echo "up "
   echo "down "

   echo "publishCommon "
   echo "cleanJava "
   echo "cleanDocker "
   echo "cleanDatabases "
   echo "cleanAll "
   exit
}

function up() {
  sudo docker-compose --env-file "environments/.env.${ENV}" up
}

function down() {
  sudo docker-compose --env-file environments/.env.${ENV} down
}

function build() {
  sudo docker-compose --env-file environments/.env.${ENV} build \
    --build-arg actor="${LOCAL_GITHUB_ACTOR}" \
    --build-arg token="${LOCAL_GITHUB_TOKEN}"
}

function cleanDocker() {
  docker system prune -a
}

function cleanJava() {
  clean_command="./gradlew clean; rm -rf .gradle"
  sudo bash -c "cd ../lostcities-accounts/; ${clean_command}"
  sudo bash -c "cd ../lostcities-matches/; ${clean_command}"
}

function cleanDatabases() {
  sudo rm -rf /var/lib/postgresql
}

function publishCommon() {
  bash -c "cd ../lostcities-common/; ./gradlew clean build publish"
}

function logs() {
  sudo docker-compose --env-file environments/.env.${ENV} logs
}

function cloneRepos() {
  cd ${WORKSPACE_ROOT} || echo "${workspaceRootError}" && exit

  if [[ ! -d "./lostcities-infrastructure" ]]; then
      git clone $INFRASTRUCTURE_REPO
  fi

  if [[ ! -d "./lostcities-accounts" ]]; then
    git clone $ACCOUNTS_REPO
  fi

  if [[ ! -d "./lostcities-matches" ]]; then
    git clone $MATCHES_REPO
  fi

  if [[ ! -d "./lostcities-frontend" ]]; then
      git clone $FRONTEND_REPO
  fi

  if [[ ! -d "./lostcities-common" ]]; then
    git clone $COMMON_REPO
  fi
}

while getopts e:h o; do
  case $o in
    (e) ENV=$OPTARG;;
    (h) help;;
    (*)
  esac
done

cd ${INFRASTRUCTURE_ROOT} || exit

for var in "$@"; do

    case "$var" in
      (up) up;;
      (down) down;;
      (build) build;;
      (publishCommon) publishCommon;;
      (cleanJava) cleanJava;;
      (cleanDocker) cleanDocker;;
      (cleanDatabases) cleanDatabases;;
      (cleanAll) cleanJava && cleanDocker && cleanDatabases;;
      (cloneRepos) cloneRepos;;
    esac
done
