#!/bin/bash

TESTS_DIR="/app/tests"

for TEST_DIR in $TESTS_DIR/*; do
    if [ -d "$TEST_DIR" ]; then
        bash /app/test.sh $TEST_DIR
        if [ $? -ne 0 ]; then
            exit 1
        fi
    fi
done

echo "All tests passed!"
exit 0