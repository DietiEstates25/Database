#!/bin/bash

echo "" > .log

echo "Start script for creating PostgreSQL database"
echo "using .sql file in the current directory"
echo ""

DB_NAME="ingsw_db"
DB_USER="ingsw"

read -sp "Enter password: " DB_PASS </dev/tty

echo "LOG DATE: $(date)" >> .log

export PGPASSWORD="${DB_PASS}"

for file in *.sql; do
    echo "" >> .log
    echo "Executing file ""${file}" >> .log
    psql -h localhost -d "${DB_NAME}" -U "${DB_USER}" -f "${file}" >> .log 2>&1
done

unset PGPASSWORD

echo "" >> .log
echo "Database PostgreSQL created successfully" >> .log
echo ""

cat .log

exit 0
