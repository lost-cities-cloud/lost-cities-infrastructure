#!/usr/bin/env bash

source common.properties

cd "$WORKSPACE_ROOT" || exit

function gradleBuild() {
  echo "Building $1"
  cd "$1" || exit
  time ./gradlew clean bootBuildImage 1> /dev/null &
}

function dockerStop() {
  cd "$INFRASTRUCTURE_ROOT" || exit
  docker-compose stop accounts gamestate matches player-events
}

function dockerStart() {
  cd "$INFRASTRUCTURE_ROOT" || exit
  docker-compose up --build accounts gamestate matches player-events
}

dockerStop

for project_dir in $GRADLE_PROJECTS; do
  gradleBuild "$WORKSPACE_ROOT/${project_dir}"
done
wait

dockerStart
echo "Completed"
