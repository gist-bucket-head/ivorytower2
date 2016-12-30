#!/bin/bash
psql -U cjm cjm -c "select location, id, name from tech order by location;"
