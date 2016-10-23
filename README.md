# skimdb-replicator
Docker-Image containing a couchdb replicating the npm-skimdb

This image uses the [official couchdb image](https://hub.docker.com/_/couchdb/) to setup up a replication of
[npm's skimdb](https://skimdb.npmjs.com/registry).

In order for the replication to work, the credentials of an admin-user must be provided

In "docker run", you can use "-e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password", which
will automically setup the admin credentials in couchdb.
If you setup the credentials elsewhere, you can provide them to the replicator using
"-e REPLICATION_LOGIN=admin -e REPLICATION_PASSWD=password"

For volumes, exposed ports and other configuration examples, please refer to the [documentation of
the couchdb docker-image](https://hub.docker.com/_/couchdb/)

Note that skimdb is using couchdb 2.0 while this couchdb is still 1.6. Replication seems to work across
these versions.

# Related

* Commands to replicate skimdb: https://github.com/iros/local-npmjs-skimdb


