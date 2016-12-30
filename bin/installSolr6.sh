#!/bin/sh
#prerequisite is JDK 8.
LATEST=6.2.1
cd ~
echo "This is dangerous."
pkill java
rm -rf solr-$LATEST.tgz*
wget http://www-eu.apache.org/dist/lucene/solr/$LATEST/solr-$LATEST.tgz
tar xzvf solr-$LATEST.tgz
rm -rf solr-$LATEST.tgz*
cd solr-$LATEST
bin/solr start
google-chrome http://localhost:8983 &
