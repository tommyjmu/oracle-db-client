#!/usr/bin/env bash

if [ "$1" = 'dump' ]; then
    exp ${DB_USERNAME}/${DB_PASSWORT}@${DB_HOST}:${DB_PORT}/${DB_SERVICENAME} -file=/data/dump.dmp
    exit 0
fi

exec "$@"