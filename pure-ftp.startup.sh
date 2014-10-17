#!/bin/sh

# initial run
pure-pw mkdb

# watch for changes of virtual users and rebuild internal db after
while inotifywait -qq -e modify /etc/pure-ftpd/pureftpd.passwd; do
    pure-pw mkdb
done
