#!/bin/bash
if [ "$#" -ne 5 ]; then
  echo "Usage: addtech.sh NAME(str) DESCRIPTION(str) PRIORITY(int 0-100) RATING(int 0-100) EXPERTISE(int 0-100)"
  exit 1;
fi
NAME=$1
DESCRIPTION=$2
PRIORITY=$3
RATING=$4
EXPERTISE=$5
#CLEANSTRING=${STRING//[^a-zA-Z0-9]/}
psql -U cjm cjm -c "insert into tech (name, description, priority, rating, expertise) values ('$NAME', '$DESCRIPTION', $PRIORITY, $RATING, $EXPERTISE)"
