# DB_perf
#########

## Test DB performances through a jmeter test plan
## Test plan TEST_JMX is executed NUM_LOOPS times, with NUM_USERS concurrent users
## Synthetic result OUT_JSON is the sum of the elapsed time of each operation.

# Requirements
# - Apache Jmeter and dependencies (Java 8) installed: https://jmeter.apache.org/download_jmeter.cgi

# Temporary directory
TMP_DIR=/tmp
# JMeter install folder
JMETER_FOLDER=/c/apps/apache-jmeter-5.5/bin
# JMX test to be executed
TEST_JMX=JDBC_test.jmx
# Number of simulated users/threads
NUM_USERS=100
# Number of time to executes the test
NUM_LOOPS=100
# JSON output
OUT_JSON=./result.json