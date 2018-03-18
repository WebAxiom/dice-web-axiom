#!/usr/bin/env bash

function program_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}

if [ $(program_is_installed axiom) == "0" ]; then
    echo "Axiom is not installed on the system."
    echo "Please install it before running the script."
    echo "More information at http://www.axiom-developer.org/"
  else
    ip=$(hostname --ip-address)
    app_port=${1:-3000}
    api_port=${2:-3001}

    echo -e "HOST=$ip\nAPP_PORT=$app_port\nAPI_PORT=$api_port" > .env



    if [ $(program_is_installed node) == "0" ]; then
          PATH=$PATH:$(pwd)/node/bin
    fi


    ./node/bin/npm run api &
    ./node/bin/npm run app
fi
