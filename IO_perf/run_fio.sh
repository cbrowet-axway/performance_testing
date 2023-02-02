#!/bin/sh

. ./env.sh

rm -rf $TST_DIR
mkdir -p $TST_DIR

export TST_DIR
for i in $FIO_JOBS; do
  fio --group_reporting --size=10G --output-format=json --output="$TST_DIR/${i%.*}.json" "$i"
done
jq -s '{"result": [.[].jobs[].read.iops, .[].jobs[].write.iops] | add }' $TST_DIR/*.json  > $OUT_JSON