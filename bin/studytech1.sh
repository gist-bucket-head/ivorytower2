#!/bin/bash
psql -U cjm cjm -c "select location, id, name from tech where study=1 OFFSET floor(random()*(select count(*) from tech where study=1)) limit 1;"
