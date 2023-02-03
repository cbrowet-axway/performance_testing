#!/bin/sh
. ./env.sh

rm -f $TMP_DIR/JDBC_test_summary.xml; $JMETER_FOLDER/jmeter.sh -n -t $TEST_JMX -Jnum_users=$NUM_USERS -Jnum_loops=$NUM_LOOPS -Jsummary_out=$TMP_DIR/JDBC_test_summary.xml && xsltproc sum_elsapsed.xslt $TMP_DIR/JDBC_test_summary.xml > $OUT_JSON