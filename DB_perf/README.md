# DB_perf

Test DB performances through a jmeter test plan.  
Test plan TEST_JMX is executed NUM_LOOPS times, with NUM_USERS concurrent users.  
Synthetic result OUT_JSON is the sum of the elapsed time of each operation.

## Requirements

- Apache Jmeter and dependencies (Java 8) installed: https://jmeter.apache.org/download_jmeter.cgi
- `xsltproc` for result extraction
