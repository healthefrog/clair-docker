#!/bin/sh -e

envsubst < /config.yaml.tpl > /config.yaml

exec "$@"
