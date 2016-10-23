#!/usr/bin/env bash

LOGIN=${REPLICATION_LOGIN-${COUCHDB_USER}}
PASSWORD=${REPLICATION_PASSWORD-${COUCHDB_PASSWORD}}

if [ "$LOGIN" ] && [ "$PASSWORD" ]; then
    (
        # Wait for couchdb to come up
        sleep 3


        #curl --silent -X POST "http://localhost:5984/_replicate" \
        #   -d '@/replicator.json' \
        #   -H "Content-Type: application/json"

        echo "skimdb replicator set up"

    ) &
else
    # The - option suppresses leading tabs but *not* spaces. :)
		cat >&2 <<-'EOWARN'
			****************************************************
			WARNING: No admin user and password provided to start replication
			         Please provide either REPLICATOR_LOGIN and REPLICATOR_PASSWORD
			         or CHOUCHDB_USER and COUCHDB_PASSWORD in order to start replication.
			         I will now quit because the whole point of this image *is* the
			         replication

			         Use "-e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password"
			         or "-e REPLICATION_LOGIN=admin -e REPLICATION_PASSWD=password"
			         to set it in "docker run".
			****************************************************
		EOWARN
		exit 1
fi

exec tini -- /docker-entrypoint.sh "$@"

