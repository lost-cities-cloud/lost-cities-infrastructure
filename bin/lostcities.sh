#!/usr/bin/env bash
export ENV="dev"

. common.properties

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
   echo "build "
   echo "restart "
   echo "restartJavaApps"
   echo ""
   echo "publishCommon "
   echo "cleanJava "
   echo "cleanDocker "
   echo "cleanDatabases "
   echo "cleanAll "
   echo "cleanAllDocker "
   exit
}

function restart() {
  docker-compose --env-file environments/.env.${ENV} restart
}

function cleanRestart() {
  down
  cleanAllDocker
  build
  up
}

function assemble() {
  rm -rf ~/.gradle/
  bash -c "cd ../lostcities-accounts/; ./gradlew clean assemble"
  bash -c "cd ../lostcities-matches/; ./gradlew assemble assemble"
}

function build() {
  . "$BIN_DIR/build.sh" "$@"
}

function down() {
  docker-compose down
}

function up() {
  docker-compose --env-file "environments/.env.${ENV}" up
}

function start() {
  docker-compose --env-file "environments/.env.${ENV}" start "$@"
}

function stop() {
  docker-compose --env-file "environments/.env.${ENV}" stop "$@"
}


function restartJava() {
  docker-compose --env-file environments/.env.${ENV} restart matches accounts
}

function cleanDocker() {
  docker-compose rm -f -v
}

function cleanAllDocker() {
  docker system prune -a -f
}

function cleanJava() {
  clean_command="./gradlew clean; rm -rf .gradle"
  bash -c "cd ../lostcities-accounts/; ${clean_command}"
  bash -c "cd ../lostcities-matches/; ${clean_command}"
}

function cleanDatabases() {
  rm -rf /var/lib/postgresql
}

function publishCommon() {
  bash -c "cd ../lostcities-common/; ./gradlew clean build publish"
}

function logs() {
  docker-compose --env-file environments/.env.${ENV} logs
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



case "$1" in
  (up) up;;
  (down) down;;
  (start) shift; start "$@";;
  (stop) shift; stop "$@";;
  (build) shift; build "$@";;
  (restart) restart;;
  (assemble) assemble;;
  (cleanRestart) cleanRestart;;
  (restartJava) restartJava;;
  (publishCommon) publishCommon;;
  (cleanJava) cleanJava;;
  (cleanDocker) cleanDocker;;
  (cleanDatabases) cleanDatabases;;
  (cleanAll) cleanJava && cleanDocker && cleanDatabases;;
  (cleanAllDocker)cleanAllDocker;;
  (cloneRepos) cloneRepos;;
  (*)
esac

