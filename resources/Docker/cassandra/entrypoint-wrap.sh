#!/bin/bash

export CASSANDRA_KEYSPACE=microworld

if [[ ! -z "$CASSANDRA_KEYSPACE" && $1 = 'cassandra' ]]; then
  # Create default keyspace for single node cluster
  CQL="CREATE KEYSPACE $CASSANDRA_KEYSPACE WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};
  CREATE TABLE IF NOT EXISTS microworld.product (id text PRIMARY KEY,description text);
  CREATE TABLE IF NOT EXISTS microworld.price (id text PRIMARY KEY,price decimal);"
  until echo $CQL | cqlsh; do
    echo "cqlsh: Cassandra is unavailable - retry later"
    sleep 2
  done &
fi

exec /docker-entrypoint.sh "$@"