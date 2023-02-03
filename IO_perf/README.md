# IO_perf

Test IO performances through a set of [fio](https://fio.readthedocs.io/en/latest/fio_doc.html) jobs.  
Test jobs FIO_JOBS are executed.  
Synthetic result OUT_JSON is the sum of the io per seconds results of all jobs.

## Requirements

- `fio` installed: https://fio.readthedocs.io/en/latest/fio_doc.html#binary-packages
- `jq` for result extraction

## Specific files

- `*.fio`: `fio` job files (see product documentation).
