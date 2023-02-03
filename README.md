# Performance Testing framework

This code is the baseline for a performance testing framework.  
Each subdirectory contains a type of test:

- `DB_perf`: Tests database performance
- `IO_perf`: Tests disk I/O

Each subdirectory contains:

- `README.md`: a README file detailing the specifics of each test
- `run.sh`: Script to run to execute the test
- `env.sh`: Variables pertaining to the test
- Various files depending on the type of test

Each `run.sh` will generate a single json file containing a single, synthetic, "result" field, whose meaning depends on the test.

.e.g.:

```json
{
  "result": 29245377
}
```
