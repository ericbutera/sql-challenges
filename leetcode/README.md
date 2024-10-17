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

```sh
make test
```

## TODO

- Fix manual edit of testcase to match SQLite formatted output (column hyphens)
- Handle any order output
