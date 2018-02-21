#!/usr/bin/env bash

trap 'kill %1; kill %2' SIGINT
env-cmd .env babel-node api & env-cmd .env nuxt start