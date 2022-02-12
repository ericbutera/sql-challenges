```bash
# goal: figure out how to make backup & restore
c:\Users\ericb\.vscode\extensions\ms-mssql.mssql-1.11.1\sqltoolsservice\3.0.0-release.139\Windows
pg_dump.exe --verbose --host=localhost --port=5432 --username=postgres --format=p --inserts --file dump-postgres-202111251142.sql -n "video_store" postgres
docker-compose run postgres pg_dump --verbose --host=localhost --port=5432 --username=postgres -n "video_store"

pg_dump --verbose --host=localhost --port=5432 --username=postgres --format=p -n "video_store"

# backup
pg_dump --host=localhost --port=5432 --username=postgres -n "video_store"
# restore
psql --host=localhost --port=5432 --username=postgres -d video_store -f /shared/postgres/dump.sql

# note: \l lists databases in psql
```