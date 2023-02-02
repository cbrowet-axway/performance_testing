# IO_perf
#########

## Test IO performances through a set of fio jobs.
## Test jobs FIO_JOBS are executed
## Synthetic result OUT_JSON is the sum of the io per seconds results of all jobs.

# Requirements
# - fio installed: https://fio.readthedocs.io/en/latest/fio_doc.html#binary-packages

# Temporary directory
TMP_DIR=/tmp
# Test directory (to be set on the FS to be tested)
TST_DIR=/mnt/tbt/fio
# FIO jobs to be executed
FIO_JOBS="Test05-Typerw-BS8k-DeviceCount05.fio Test05-Typerandrw-BS8k-DeviceCount05.fio"
# JSON output
OUT_JSON=./result.json