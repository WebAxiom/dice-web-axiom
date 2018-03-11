#!/usr/bin/env bash

echo "Extracting node"
tar -zxf node.tar.gz node/
#rm node.tar.gz

echo "Extracting node modules"
tar -zxf node_modules.tar.gz node_modules/
#rm node_modules.tar.gz

echo "Extracting nuxt binaries"
tar -zxf nuxt.tar.gz .nuxt/
#rm nuxt.tar.gz

echo "Creating .env file"
echo -e "HOST=$ip\nAPP_PORT=$app_port\nAPI_PORT=$api_port" > .env
