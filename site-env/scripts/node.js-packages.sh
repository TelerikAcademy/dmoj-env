#!/usr/bin/env bash

# LOGS_FILE=$1/`basename "$0"`.log
LOGS_FILE=/dev/stdout


function npm_package_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  npm list -g --depth=0 | grep $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}

if [ $(npm_package_is_installed pleeease-cli) = 1 ]; then
    echo -e "pleeease-cli is allready installed\n" >> $LOGS_FILE
else
    echo -e "pleeease-cli is not installed\n" >> $LOGS_FILE
    npm install -g pleeease-cli >> $LOGS_FILE
fi;