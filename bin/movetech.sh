#!/bin/bash
echo "Usage: ./movetech.sh <location> <id>"
psql -U cjm cjm -c "update tech set location="$2" where ID="$1
