#!/usr/bin/env bash

source common.properties

cd "$WORKSPACE_ROOT" || exit

function gradleBuild() {
  echo "Building $1"
  cd "$1" || exit
  time ./gradlew bootBuildImage 1> /dev/null &
}

for project_dir in $GRADLE_PROJECTS; do
    gradleBuild "$WORKSPACE_ROOT/${project_dir}"
done
wait
echo "Completed"