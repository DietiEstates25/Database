#!/bin/bash

echo "Start script for creating PostgreSQL database"
echo "using .sql file in the current directory"
echo ""

DB_NAME="ingsw_db"
DB_USER="ingsw"

read -sp "Enter password: " DB_PASS </dev/tty

# Create new file at start
echo "LOG DATE: $(date)" > error.log
echo "" >> error.log

export PGPASSWORD="${DB_PASS}"

find . -type f -name "*.sql" | sort | while read -r file; do
    echo ""
    echo ""
    echo "/*******************************************************************"
    echo " * Executing file ""${file#*./}"
    echo " ******************************************************************/"
    echo ""
    stdbuf -o0 -e0 psql -h localhost -d "${DB_NAME}" -U "${DB_USER}" -f "${file}" 2> >(tee -a error.log >&2)
    echo "--------------------------------------------------------------------"
done

unset PGPASSWORD

echo ""
echo ""
echo "////////////////////////////////////////////////////////////////////////"
echo "Script ended. Print error log"
echo "////////////////////////////////////////////////////////////////////////"
echo ""

cat error.log

exit 0
