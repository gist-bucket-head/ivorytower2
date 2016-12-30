#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Illegal number of arguments. must be 1 to indicate size, like 4096."
  exit
fi
SIZE=$1
echo "Building Linode ${SIZE}..."
BIRTHNAME=`date +%s%N | cut -b1-13`
sleep 1
CHRISTIANNAME=`date +%s%N | cut -b1-13`
linode create ivory$BIRTHNAME --plan "Linode "$SIZE --distribution "Ubuntu 16.04 LTS" --datacenter newark --group IvoryTower
linode -o ivory$BIRTHNAME -a rename --label ivory$BIRTHNAME --new-label ivory$CHRISTIANNAME
linode -a show --label ivory$CHRISTIANNAME
