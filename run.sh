#!/usr/bin/env bash

trap 'kill %1; kill %2' SIGINT
node/bin/npm run api & node/bin/npm run app
