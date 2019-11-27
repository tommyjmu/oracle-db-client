#!/usr/bin/env bash

if [ "$1" = 'dump' ]; then
  shift
  echo "INFO: dumping database. Executing: "
  echo "exp ${DB_USERNAME}/${DB_PASSWORT}@${DB_HOST}:${DB_PORT}/${DB_SERVICENAME} $* -file=/data/dump.dmp"
  exp ${DB_USERNAME}/${DB_PASSWORT}@${DB_HOST}:${DB_PORT}/${DB_SERVICENAME} $* -file=/data/dump.dmp
  exit $?
fi

exec "$@"
