#!/usr/bin/env bash


ip=$(hostname --ip-address)
app_port=${1:-3000}
api_port=${2:-3001}

if [[ $api_port < 1024 || $api_port > 9999 ]]; then
    echo "Api port '$api_port' is not in range [1024, 9999]."
    exit 1
fi

if [[ $app_port < 1024 || $app_port > 9999 ]]; then
    echo "App port '$app_port' is not in range [1024, 9999]."
    exit 1
fi

if ! [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Could not locate machine's ip address. Contact the developer. WebAxiomDev@gmail.com"
    exit 1
fi

echo "Extracting node modules"
tar -zxvf node_modules.tar.gz node_modules/

echo "Extracting nuxt binaries"
tar -zxvf nuxt.tar.gz .nuxt/

echo "Creating .env file"
echo -e "HOST=$ip\nAPP_PORT=$app_port\nAPI_PORT=$api_port" > .env