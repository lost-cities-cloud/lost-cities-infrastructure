#!/usr/bin/env bash

source common.properties

LOSTCITIES_BIN_DIR="${WORKSPACE}/lostcities-infrastructure/bin"
USER_BASHRC="${HOME}/.zshrc"

mkdir -p "$WORKSPACE"

cd "$WORKSPACE" || exit

if [[ ! -d "./lostcities-infrastructure" ]]; then
  git clone "$INFRASTRUCTURE_REPO"
fi

if [[ ! -d "./lostcities-accounts" ]]; then
  git clone "$ACCOUNTS_REPO"
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


if test -f "$USER_BASHRC"; then
  echo "export PATH=\$PATH:${LOSTCITIES_BIN_DIR}" >> "${USER_BASHRC}"
  echo "alias lostcities='lostcities.sh'" >> "${USER_BASHRC}"
  echo "alias lcdev='lostcities.sh'" >> "${USER_BASHRC}"
else
  touch "${USER_BASHRC}"
  echo "export PATH=\$PATH:${LOSTCITIES_BIN_DIR}" >> "${USER_BASHRC}"
  echo "alias lostcities='lostcities.sh'" >> "${USER_BASHRC}"
  echo "alias lcdev='lostcities.sh'" >> "${USER_BASHRC}"
fi

export PATH=$PATH:${LOSTCITIES_BIN_DIR}
alias lostcities='lostcities.sh'
alias lsc='lostcities.sh'