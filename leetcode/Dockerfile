FROM alpine/sqlite:latest

WORKDIR /app

RUN apk add --no-cache bash diffutils

COPY ./entrypoint.sh /app/entrypoint.sh
COPY ./test.sh /app/test.sh
COPY ./tests /app/tests

ENTRYPOINT ["bash", "/app/entrypoint.sh"]
