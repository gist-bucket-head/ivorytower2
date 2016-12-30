#!/bin/sh
TIMESTAMP=`date +%s%N`
pg_dump cjm > cjm_$TIMESTAMP.bak
more cjm_$TIMESTAMP.bak
ccrypt cjm_$TIMESTAMP.bak
#use ccdecrypt to decrypt
