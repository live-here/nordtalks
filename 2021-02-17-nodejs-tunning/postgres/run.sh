#!/bin/bash

main() {
  if [ ! "$(docker ps -q -f name=nordtalk-pg)" ]; then
    docker run \
      -d \
      --rm \
      --name nordtalk-pg \
      -p 5432:5432 \
      -e POSTGRES_PASSWORD=password \
      -v $PWD/postgres/docker-entrypoint-initdb.d:/docker-entrypoint-initdb.d \
      -v $PWD/postgres/postgresql/postgres.conf:/etc/postgresql/postgresql.conf \
      -v $PWD/postgres/pgdata:/var/lib/postgresql/data \
      postgres:11.9 -c config_file=/etc/postgresql/postgresql.conf
  else
    echo "Local Postgres container already running"
  fi
}

main "$@"
