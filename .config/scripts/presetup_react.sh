#!/bin/bash
export BROWSER=false
export NODE_OPTIONS=--openssl-legacy-provider

exec "$@"
