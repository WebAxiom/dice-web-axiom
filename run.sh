#!/usr/bin/env bash

function program_is_not_installed {
  # set to 1 initially
  local return_=0
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=1; }
  # return value
  echo "$return_"
}

ip=$(hostname --ip-address)
app_port=${1:-3000}
api_port=${2:-3001}

# echo "Creating .env file"
echo -e "HOST=$ip\nAPP_PORT=$app_port\nAPI_PORT=$api_port" > .env

if [ $(program_is_not_installed node) == "1" ]; then
      PATH=$PATH:$(pwd)/node/bin
fi

./node/bin/npm start
