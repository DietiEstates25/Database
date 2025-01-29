#!/bin/bash

echo "Start script for creating PostgreSQL database"
echo "using .sql file in the current directory"
echo ""

DB_NAME="ingsw_db"
DB_USER="ingsw"

read -sp "Enter password: " DB_PASS </dev/tty

# Create new file at start
echo "LOG DATE: $(date)" > error.log

export PGPASSWORD="${DB_PASS}"

find . -type f -name "*.sql" | sort | while read -r file; do
    echo ""
    echo "Executing file ""${file#*./}"
    echo ""
    stdbuf -o0 -e0 psql -h localhost -d "${DB_NAME}" -U "${DB_USER}" -f "${file}" 2> >(tee -a error.log >&2)
done

unset PGPASSWORD

echo ""
echo ""
echo ""
echo ""
echo "////////////////////////////////////////////////////////////////////////"
echo "Script ended. Print log"
echo "////////////////////////////////////////////////////////////////////////"
echo ""
echo ""

cat error.log

exit 0
