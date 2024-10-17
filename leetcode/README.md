# Leetcode SQL Tests

This is a low-effort test runner for leetcode problems.

---

## Adding tests

Expected directory structure:

| file | description |
| -- | -- |
| `schema.sql` | Mixed DDL & DML to seed the database |
| `query.sql` | Challenge query |
| `expected.sql` | Expected query output |

## Running tests

A `Makefile` is provided to run tests among other things:

```sh
make test
```

Expected output:

```txt
Running test in /app/tests/combine_two_tables
Test passed!
Running test in /app/tests/duplicate_emails
Test passed!
All tests passed!
```

## TODO

- Fix manual edit of testcase to match SQLite formatted output (column hyphens)
- Handle any order output
