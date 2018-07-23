#!/bin/sh -e

psql postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'clair'" | grep -q 1 || psql postgres -c "create database clair owner root"
exec /clair -config /config.yaml
