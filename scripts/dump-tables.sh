#!/usr/bin/env bash

echo "INFO: Dumping tables: ${DB_TABLE_NAMES}"

for TABLE_NAME in ${DB_TABLE_NAMES}; do
  echo "INFO: Dumping table: ${TABLE_NAME}"
  exp ${DB_USERNAME}/${DB_PASSWORT}@${DB_HOST}:${DB_PORT}/${DB_SERVICENAME} DIRECT=Y TABLES="${TABLE_NAME}" LOG=/data/${TABLE_NAME}.LOG FILE=/data/${TABLE_NAME}.dmp
done
