#!/bin/sh

echo "Starting Docker..."
sh -c "docker run -d -p 5984:5984 -p 5986:5986 couchdb:$INPUT_COUCHDB_VERSION"
echo "Started Docker..."
echo "Waiting for CouchDB..."
sleep 20
echo "done."
echo "DOCKER PS"
docker ps
export NAME=`docker ps --format "{{.Names}}" --last 1`
echo "DOCKER TOP"
docker top $NAME
echo "DOCKER LOGS"
docker logs $NAME
echo "DOCKER EXEC"
docker exec $NAME curl -i http://127.0.0.1:5984/
echo "Checking CouchDB:"
curl -i http://localhost:5984/
