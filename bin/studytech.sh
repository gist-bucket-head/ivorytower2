#!/bin/bash
psql -U cjm cjm -c "select location, id, name from tech where study=1 order by location;"
