#!/bin/bash
psql -U cjm cjm -c "select name from tech order by (priority*7 + rating*3 + expertise*0.5) desc;"
