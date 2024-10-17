#!/bin/bash

TEST_DIR=$1

if [ -z "$TEST_DIR" ]; then
    echo "Please provide a test directory."
    exit 1
fi

echo "Running test in $TEST_DIR"

cp $TEST_DIR/schema.sql /app/schema.sql
cp $TEST_DIR/query.sql /app/query.sql
cp $TEST_DIR/expected.txt /app/expected.txt

rm -f /app/db.sqlite3
sqlite3 /app/db.sqlite3 < /app/schema.sql

sqlite3 -header -markdown /app/db.sqlite3 < /app/query.sql > /app/output.txt

if diff -w -q /app/output.txt /app/expected.txt > /dev/null; then
    echo "Test passed!"
    exit 0
else
    echo "Test failed. Differences:"
    diff /app/output.txt /app/expected.txt
    exit 1
fi
