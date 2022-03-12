#!/usr/bin/env bash

cd "$LOSTCITIES_INFRASTRUCTURE_ROOT"

source "./bin/common.properties"

function bootRun() {
  echo "Building $1"
  cd "$1" || exit
  time ./gradlew bootRun > /dev/null &
}

function dockerStop() {
  cd "$INFRASTRUCTURE_ROOT" || exit
  docker-compose stop accounts gamestate matches player-events
}

function dockerStart() {
  cd "$INFRASTRUCTURE_ROOT" || exit
  docker-compose up --build accounts gamestate matches player-events --detach
}

#dockerStop

for project_dir in $GRADLE_PROJECTS; do
  bootRun "$WORKSPACE_ROOT/${project_dir}"
done
wait

#dockerStart

echo "Completed"
