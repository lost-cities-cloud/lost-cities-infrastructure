#!/usr/bin/env bash

source common.properties

LOSTCITIES_BIN_DIR="${WORKSPACE_ROOT}/lostcities-infrastructure/bin"
LOSTCITIES_LIB_DIR="${WORKSPACE_ROOT}/lostcities-infrastructure/lib"
USER_BASH_PROFILE="${HOME}/.bash_profile"

mkdir -p "$WORKSPACE_ROOT"

cd "$WORKSPACE_ROOT" || exit

if [[ ! -d "./lostcities-infrastructure" ]]; then
  git clone "$INFRASTRUCTURE_REPO"
fi

if [[ ! -d "./lostcities-gamestate" ]]; then
  git clone "$GAMESTATE_REPO"
fi

if [[ ! -d "./lostcities-accounts" ]]; then
  git clone "$ACCOUNTS_REPO"
fi

if [[ ! -d "./lostcities-player-events" ]]; then
  git clone "$PLAYER_EVENTS_REPO"
fi

if [[ ! -d "./lostcities-matches" ]]; then
  git clone "$MATCHES_REPO"
fi

if [[ ! -d "./lostcities-frontend" ]]; then
    git clone "$FRONTEND_REPO"
fi

if [[ ! -d "./lostcities-common" ]]; then
  git clone "$COMMON_REPO"
fi

cd ./lostcities-infrastructure || exit

chmod -R 755 "${LOSTCITIES_BIN_DIR}"
chmod u+x,g+x ./bin/lostcities.sh


#if test -f "USER_BASH_PROFILE"; then
#  echo "export PATH=\$PATH:${LOSTCITIES_BIN_DIR}" >> "${USER_BASH_PROFILE}"
#  echo "alias lostcities='lostcities.sh'" >> "${USER_BASH_PROFILE}"
#  echo "alias lcdev='lostcities.sh'" >> "${USER_BASH_PROFILE}"
#else
#  touch "${USER_BASH_PROFILE}"
#  echo "export PATH=\$PATH:${LOSTCITIES_BIN_DIR}" >> "${USER_BASH_PROFILE}"
#  echo "alias lostcities='lostcities.sh'" >> "${USER_BASH_PROFILE}"
#  echo "alias lcdev='lostcities.sh'" >> "${USER_BASH_PROFILE}"
#fi

#export PATH=$PATH:${LOSTCITIES_BIN_DIR}
#alias lostcities='lostcities.sh'
alias lcdev='lostcities.sh'

#desktop-file-install --dir="${HOME}/.local/share/applications" "${LOSTCITIES_LIB_DIR}/lost-cities-monitoring.desktop"


