#!/bin/bash

echo "Start script for creating PostgreSQL database"
echo "using .sql file in the current directory"
echo ""

DB_NAME="ingsw_db"
DB_USER="ingsw"

read -sp "Enter password: " DB_PASS </dev/tty

export PGPASSWORD="${DB_PASS}"

for file in *.sql; do
    echo ""
    echo "Executing file ""${file}"
    psql -h localhost -d "${DB_NAME}" -U "${DB_USER}" -f "${file}"
done

unset PGPASSWORD

echo ""
echo "Database PostgreSQL created successfully"

exit 0
