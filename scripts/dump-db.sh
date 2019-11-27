#!/usr/bin/env bash

echo "INFO: Dumping database: ${DB_USERNAME}"

exp ${DB_USERNAME}/${DB_PASSWORT}@${DB_HOST}:${DB_PORT}/${DB_SERVICENAME} DIRECT=Y LOG=/data/${DB_USERNAME}.LOG FILE=/data/${DB_USERNAME}.dmp
