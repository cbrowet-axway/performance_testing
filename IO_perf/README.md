# IO_perf

Test IO performances through a set of [fio](https://fio.readthedocs.io/en/latest/fio_doc.html) jobs.  
Test jobs FIO_JOBS are executed.  
Synthetic result OUT_JSON is the sum of the io per seconds results of all jobs.

## Requirements

- `fio` installed: https://fio.readthedocs.io/en/latest/fio_doc.html#binary-packages
- `jq` for result extraction

## Specific files

- `*.fio`: `fio` job files are used to define what fio is supposed to do.  
The job file format is the classic ini file, where the names enclosed in [] brackets define the job name. You are free to use any ASCII name you want, except global which has special meaning. Following the job name is a sequence of zero or more parameters, one per line, that define the behavior of the job. If the first character in a line is a ‘;’ or a ‘#’, the entire line is discarded as a comment.

## Examples

- `fio`job file

```ini
[global]
ioengine=libaio          # Linux native asynchronous I/O. Other option: "windowsaio" on windows
invalidate=1             # Invalidate the buffer/page cache parts of the files to be used prior to starting I/O 
ramp_time=5              # run the specified workload for this amount of time before logging any performance numbers
iodepth=1                # Number of I/O units to keep in flight against the file. Default = 1
runtime=30               # Limit runtime
time_based               # fio will run for the duration of the runtime specified even if the file(s) are completely read or written
direct=1                 # use non-buffered I/O
group_reporting=1        # see the final report per-group instead of per-job,
per_job_logs=0           # jobs with identical names will share the log filename

bs=8k                    # The block size in bytes used for I/O units
rw=randrw                # Random R/W tests. Other options are :
                         #  "read"
                         #    Sequential reads.
                         #  "write"
                         #    Sequential writes.
                         #  "trim"
                         #    Sequential trims (Linux block devices and SCSI character devices only).
                         #  "randread"
                         #    Random reads.
                         #  "randwrite"
                         #    Random writes.
                         #  "randtrim"
                         #    Random trims (Linux block devices and SCSI character devices only).
                         #  "rw","readwrite"
                         #    Sequential mixed reads and writes.
                         #  "randrw"
                         #    Random mixed reads and writes.

[test1-subtest1-blocksize8k-threads1-device1of5]    # Job name
 stonewall                                          # Wait for preceding jobs in the job file to exit, before starting this one
 numjobs=1                                          # Create the specified number of threads/processes
 filename=${TST_DIR}/device01                       # File to use
[test1-subtest1-blocksize8k-threads1-device2of5]
 numjobs=1
 filename=${TST_DIR}/device02
 
[test1-subtest5-blocksize8k-threads5-device1of5]
 stonewall
 numjobs=5
 filename=${TST_DIR}/device01
[test1-subtest5-blocksize8k-threads5-device2of5]
 numjobs=5
 filename=${TST_DIR}/device02
 
[test1-subtest10-blocksize8k-threads10-device1of5]
 stonewall
 numjobs=10
 filename=${TST_DIR}/device01
[test1-subtest10-blocksize8k-threads10-device2of5]
 numjobs=10
 filename=${TST_DIR}/device02
```

- `fio` json output

```json
{
  "fio version" : "fio-3.16",
  "timestamp" : 1680092521,
  "timestamp_ms" : 1680092521090,
  "time" : "Wed Mar 29 14:22:01 2023",
  "global options" : {
    "size" : "10G",
    "ioengine" : "libaio",
    "invalidate" : "1",
    "ramp_time" : "5",
    "iodepth" : "1",
    "runtime" : "30",
    "direct" : "1",
    "group_reporting" : "1",
    "per_job_logs" : "0",
    "bs" : "8k",
    "rw" : "randrw"
  },
  "jobs" : [
    {
      "jobname" : "test1-subtest1-blocksize8k-threads1-device1of5",
      "groupid" : 0,
      "error" : 0,
      "eta" : 0,
      "elapsed" : 107,
      "job options" : {
        "numjobs" : "1",
        "filename" : "/mnt/tbt/fio/device05"
      },
      "read" : {
        "io_bytes" : 1669758976,
        "io_kbytes" : 1630624,
        "bw_bytes" : 55654922,
        "bw" : 54350,
        "iops" : 6793.813746,
        "runtime" : 30002,
        "total_ios" : 203828,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 2700,
          "max" : 276900,
          "mean" : 9058.442412,
          "stddev" : 4198.891889
        },
        "clat_ns" : {
          "min" : 1600,
          "max" : 16624200,
          "mean" : 522014.600546,
          "stddev" : 644899.902053,
          "percentile" : {
            "1.000000" : 171008,
            "5.000000" : 185344,
            "10.000000" : 193536,
            "20.000000" : 203776,
            "30.000000" : 216064,
            "40.000000" : 226304,
            "50.000000" : 240640,
            "60.000000" : 259072,
            "70.000000" : 292864,
            "80.000000" : 561152,
            "90.000000" : 1695744,
            "95.000000" : 2056192,
            "99.000000" : 2408448,
            "99.500000" : 2506752,
            "99.900000" : 4079616,
            "99.950000" : 6520832,
            "99.990000" : 12124160
          }
        },
        "lat_ns" : {
          "min" : 146700,
          "max" : 16635100,
          "mean" : 531391.056185,
          "stddev" : 645049.846051
        },
        "bw_min" : 39888,
        "bw_max" : 62008,
        "bw_agg" : 93.392351,
        "bw_mean" : 50758.742655,
        "bw_dev" : 765.996058,
        "bw_samples" : 296,
        "iops_min" : 4985,
        "iops_max" : 7749,
        "iops_mean" : 6343.931073,
        "iops_stddev" : 95.756781,
        "iops_samples" : 296
      },
      "write" : {
        "io_bytes" : 1670086656,
        "io_kbytes" : 1630944,
        "bw_bytes" : 55665844,
        "bw" : 54361,
        "iops" : 6795.146990,
        "runtime" : 30002,
        "total_ios" : 203868,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 3000,
          "max" : 402000,
          "mean" : 9279.955167,
          "stddev" : 4507.046437
        },
        "clat_ns" : {
          "min" : 53700,
          "max" : 33636100,
          "mean" : 190402.220554,
          "stddev" : 258162.449921,
          "percentile" : {
            "1.000000" : 114176,
            "5.000000" : 123392,
            "10.000000" : 130560,
            "20.000000" : 140288,
            "30.000000" : 148480,
            "40.000000" : 158720,
            "50.000000" : 166912,
            "60.000000" : 177152,
            "70.000000" : 189440,
            "80.000000" : 207872,
            "90.000000" : 238592,
            "95.000000" : 272384,
            "99.000000" : 477184,
            "99.500000" : 905216,
            "99.900000" : 3293184,
            "99.950000" : 4292608,
            "99.990000" : 12648448
          }
        },
        "lat_ns" : {
          "min" : 91000,
          "max" : 33647600,
          "mean" : 199985.367002,
          "stddev" : 258722.466043
        },
        "bw_min" : 40456,
        "bw_max" : 62767,
        "bw_agg" : 93.426014,
        "bw_mean" : 50787.315537,
        "bw_dev" : 850.129589,
        "bw_samples" : 296,
        "iops_min" : 5055,
        "iops_max" : 7845,
        "iops_mean" : 6347.511017,
        "iops_stddev" : 106.319094,
        "iops_samples" : 296
      },
      "trim" : {
        "io_bytes" : 0,
        "io_kbytes" : 0,
        "bw_bytes" : 0,
        "bw" : 0,
        "iops" : 0.000000,
        "runtime" : 0,
        "total_ios" : 0,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000
        },
        "clat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000,
          "percentile" : {
            "1.000000" : 0,
            "5.000000" : 0,
            "10.000000" : 0,
            "20.000000" : 0,
            "30.000000" : 0,
            "40.000000" : 0,
            "50.000000" : 0,
            "60.000000" : 0,
            "70.000000" : 0,
            "80.000000" : 0,
            "90.000000" : 0,
            "95.000000" : 0,
            "99.000000" : 0,
            "99.500000" : 0,
            "99.900000" : 0,
            "99.950000" : 0,
            "99.990000" : 0
          }
        },
        "lat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000
        },
        "bw_min" : 0,
        "bw_max" : 0,
        "bw_agg" : 0.000000,
        "bw_mean" : 0.000000,
        "bw_dev" : 0.000000,
        "bw_samples" : 0,
        "iops_min" : 0,
        "iops_max" : 0,
        "iops_mean" : 0.000000,
        "iops_stddev" : 0.000000,
        "iops_samples" : 0
      },
      "sync" : {
        "lat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000,
          "percentile" : {
            "1.000000" : 0,
            "5.000000" : 0,
            "10.000000" : 0,
            "20.000000" : 0,
            "30.000000" : 0,
            "40.000000" : 0,
            "50.000000" : 0,
            "60.000000" : 0,
            "70.000000" : 0,
            "80.000000" : 0,
            "90.000000" : 0,
            "95.000000" : 0,
            "99.000000" : 0,
            "99.500000" : 0,
            "99.900000" : 0,
            "99.950000" : 0,
            "99.990000" : 0
          }
        },
        "total_ios" : 0
      },
      "job_runtime" : 150001,
      "usr_cpu" : 1.747322,
      "sys_cpu" : 3.669976,
      "ctx" : 407755,
      "majf" : 0,
      "minf" : 75,
      "iodepth_level" : {
        "1" : 100.000000,
        "2" : 0.000000,
        "4" : 0.000000,
        "8" : 0.000000,
        "16" : 0.000000,
        "32" : 0.000000,
        ">=64" : 0.000000
      },
      "iodepth_submit" : {
        "0" : 0.000000,
        "4" : 100.000000,
        "8" : 0.000000,
        "16" : 0.000000,
        "32" : 0.000000,
        "64" : 0.000000,
        ">=64" : 0.000000
      },
      "iodepth_complete" : {
        "0" : 0.000000,
        "4" : 100.000000,
        "8" : 0.000000,
        "16" : 0.000000,
        "32" : 0.000000,
        "64" : 0.000000,
        ">=64" : 0.000000
      },
      "latency_ns" : {
        "2" : 0.000000,
        "4" : 0.000000,
        "10" : 0.000000,
        "20" : 0.000000,
        "50" : 0.000000,
        "100" : 0.000000,
        "250" : 0.000000,
        "500" : 0.000000,
        "750" : 0.000000,
        "1000" : 0.000000
      },
      "latency_us" : {
        "2" : 0.010000,
        "4" : 0.000000,
        "10" : 0.000000,
        "20" : 0.000000,
        "50" : 0.000000,
        "100" : 0.030170,
        "250" : 73.780709,
        "500" : 15.268975,
        "750" : 1.483213,
        "1000" : 1.069179
      },
      "latency_ms" : {
        "2" : 5.324801,
        "4" : 2.959068,
        "10" : 0.069169,
        "20" : 0.013736,
        "50" : 0.010000,
        "100" : 0.000000,
        "250" : 0.000000,
        "500" : 0.000000,
        "750" : 0.000000,
        "1000" : 0.000000,
        "2000" : 0.000000,
        ">=2000" : 0.000000
      },
      "latency_depth" : 1,
      "latency_target" : 0,
      "latency_percentile" : 100.000000,
      "latency_window" : 0
    },
    {
      "jobname" : "test1-subtest5-blocksize8k-threads5-device1of5",
      "groupid" : 1,
      "error" : 0,
      "eta" : 0,
      "elapsed" : 107,
      "job options" : {
        "numjobs" : "5",
        "filename" : "/mnt/tbt/fio/device05"
      },
      "read" : {
        "io_bytes" : 3713056768,
        "io_kbytes" : 3626032,
        "bw_bytes" : 123760308,
        "bw" : 120859,
        "iops" : 15107.459503,
        "runtime" : 30002,
        "total_ios" : 453254,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 2300,
          "max" : 1225400,
          "mean" : 11154.450043,
          "stddev" : 7403.372981
        },
        "clat_ns" : {
          "min" : 127900,
          "max" : 36531400,
          "mean" : 1308756.624100,
          "stddev" : 913370.372492,
          "percentile" : {
            "1.000000" : 203776,
            "5.000000" : 240640,
            "10.000000" : 276480,
            "20.000000" : 382976,
            "30.000000" : 585728,
            "40.000000" : 897024,
            "50.000000" : 1286144,
            "60.000000" : 1630208,
            "70.000000" : 1892352,
            "80.000000" : 2113536,
            "90.000000" : 2342912,
            "95.000000" : 2506752,
            "99.000000" : 2965504,
            "99.500000" : 4014080,
            "99.900000" : 7634944,
            "99.950000" : 10289152,
            "99.990000" : 14876672
          }
        },
        "lat_ns" : {
          "min" : 143700,
          "max" : 36545300,
          "mean" : 1320311.385669,
          "stddev" : 913522.184743
        },
        "bw_min" : 65853,
        "bw_max" : 127030,
        "bw_agg" : 75.052606,
        "bw_mean" : 90707.829096,
        "bw_dev" : 468.935567,
        "bw_samples" : 1479,
        "iops_min" : 8222,
        "iops_max" : 15869,
        "iops_mean" : 11329.426554,
        "iops_stddev" : 58.610532,
        "iops_samples" : 1479
      },
      "write" : {
        "io_bytes" : 3716521984,
        "io_kbytes" : 3629416,
        "bw_bytes" : 123875807,
        "bw" : 120972,
        "iops" : 15121.558563,
        "runtime" : 30002,
        "total_ios" : 453677,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 2500,
          "max" : 4220900,
          "mean" : 11311.616635,
          "stddev" : 9671.488523
        },
        "clat_ns" : {
          "min" : 32800,
          "max" : 35786200,
          "mean" : 316590.582287,
          "stddev" : 509584.328071,
          "percentile" : {
            "1.000000" : 128512,
            "5.000000" : 144384,
            "10.000000" : 154624,
            "20.000000" : 171008,
            "30.000000" : 185344,
            "40.000000" : 201728,
            "50.000000" : 222208,
            "60.000000" : 244736,
            "70.000000" : 276480,
            "80.000000" : 329728,
            "90.000000" : 452608,
            "95.000000" : 659456,
            "99.000000" : 2113536,
            "99.500000" : 3162112,
            "99.900000" : 7307264,
            "99.950000" : 8978432,
            "99.990000" : 14352384
          }
        },
        "lat_ns" : {
          "min" : 97100,
          "max" : 35800500,
          "mean" : 328295.809794,
          "stddev" : 510457.838101
        },
        "bw_min" : 63491,
        "bw_max" : 129087,
        "bw_agg" : 75.017909,
        "bw_mean" : 90750.665254,
        "bw_dev" : 516.843946,
        "bw_samples" : 1479,
        "iops_min" : 7931,
        "iops_max" : 16128,
        "iops_mean" : 11334.876271,
        "iops_stddev" : 64.604227,
        "iops_samples" : 1479
      },
      "trim" : {
        "io_bytes" : 0,
        "io_kbytes" : 0,
        "bw_bytes" : 0,
        "bw" : 0,
        "iops" : 0.000000,
        "runtime" : 0,
        "total_ios" : 0,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000
        },
        "clat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000,
          "percentile" : {
            "1.000000" : 0,
            "5.000000" : 0,
            "10.000000" : 0,
            "20.000000" : 0,
            "30.000000" : 0,
            "40.000000" : 0,
            "50.000000" : 0,
            "60.000000" : 0,
            "70.000000" : 0,
            "80.000000" : 0,
            "90.000000" : 0,
            "95.000000" : 0,
            "99.000000" : 0,
            "99.500000" : 0,
            "99.900000" : 0,
            "99.950000" : 0,
            "99.990000" : 0
          }
        },
        "lat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000
        },
        "bw_min" : 0,
        "bw_max" : 0,
        "bw_agg" : 0.000000,
        "bw_mean" : 0.000000,
        "bw_dev" : 0.000000,
        "bw_samples" : 0,
        "iops_min" : 0,
        "iops_max" : 0,
        "iops_mean" : 0.000000,
        "iops_stddev" : 0.000000,
        "iops_samples" : 0
      },
      "sync" : {
        "lat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000,
          "percentile" : {
            "1.000000" : 0,
            "5.000000" : 0,
            "10.000000" : 0,
            "20.000000" : 0,
            "30.000000" : 0,
            "40.000000" : 0,
            "50.000000" : 0,
            "60.000000" : 0,
            "70.000000" : 0,
            "80.000000" : 0,
            "90.000000" : 0,
            "95.000000" : 0,
            "99.000000" : 0,
            "99.500000" : 0,
            "99.900000" : 0,
            "99.950000" : 0,
            "99.990000" : 0
          }
        },
        "total_ios" : 0
      },
      "job_runtime" : 750004,
      "usr_cpu" : 1.085461,
      "sys_cpu" : 2.085989,
      "ctx" : 906998,
      "majf" : 0,
      "minf" : 365,
      "iodepth_level" : {
        "1" : 100.000000,
        "2" : 0.000000,
        "4" : 0.000000,
        "8" : 0.000000,
        "16" : 0.000000,
        "32" : 0.000000,
        ">=64" : 0.000000
      },
      "iodepth_submit" : {
        "0" : 0.000000,
        "4" : 100.000000,
        "8" : 0.000000,
        "16" : 0.000000,
        "32" : 0.000000,
        "64" : 0.000000,
        ">=64" : 0.000000
      },
      "iodepth_complete" : {
        "0" : 0.000000,
        "4" : 100.000000,
        "8" : 0.000000,
        "16" : 0.000000,
        "32" : 0.000000,
        "64" : 0.000000,
        ">=64" : 0.000000
      },
      "latency_ns" : {
        "2" : 0.000000,
        "4" : 0.000000,
        "10" : 0.000000,
        "20" : 0.000000,
        "50" : 0.000000,
        "100" : 0.000000,
        "250" : 0.000000,
        "500" : 0.000000,
        "750" : 0.000000,
        "1000" : 0.000000
      },
      "latency_us" : {
        "2" : 0.000000,
        "4" : 0.000000,
        "10" : 0.000000,
        "20" : 0.000000,
        "50" : 0.010000,
        "100" : 0.010000,
        "250" : 34.042391,
        "500" : 25.085481,
        "750" : 6.689263,
        "1000" : 4.128870
      },
      "latency_ms" : {
        "2" : 16.810209,
        "4" : 12.827547,
        "10" : 0.367062,
        "20" : 0.041679,
        "50" : 0.010000,
        "100" : 0.000000,
        "250" : 0.000000,
        "500" : 0.000000,
        "750" : 0.000000,
        "1000" : 0.000000,
        "2000" : 0.000000,
        ">=2000" : 0.000000
      },
      "latency_depth" : 1,
      "latency_target" : 0,
      "latency_percentile" : 100.000000,
      "latency_window" : 0
    },
    {
      "jobname" : "test1-subtest10-blocksize8k-threads10-device1of5",
      "groupid" : 2,
      "error" : 0,
      "eta" : 0,
      "elapsed" : 107,
      "job options" : {
        "numjobs" : "10",
        "filename" : "/mnt/tbt/fio/device05"
      },
      "read" : {
        "io_bytes" : 4875198464,
        "io_kbytes" : 4760936,
        "bw_bytes" : 162490366,
        "bw" : 158681,
        "iops" : 19835.249808,
        "runtime" : 30003,
        "total_ios" : 595117,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 2600,
          "max" : 8342900,
          "mean" : 12376.414050,
          "stddev" : 21215.330421
        },
        "clat_ns" : {
          "min" : 2300,
          "max" : 45270600,
          "mean" : 1861035.241810,
          "stddev" : 1176726.545349,
          "percentile" : {
            "1.000000" : 268288,
            "5.000000" : 428032,
            "10.000000" : 626688,
            "20.000000" : 987136,
            "30.000000" : 1335296,
            "40.000000" : 1630208,
            "50.000000" : 1892352,
            "60.000000" : 2113536,
            "70.000000" : 2277376,
            "80.000000" : 2506752,
            "90.000000" : 2768896,
            "95.000000" : 3063808,
            "99.000000" : 5210112,
            "99.500000" : 6782976,
            "99.900000" : 13303808,
            "99.950000" : 16711680,
            "99.990000" : 35389440
          }
        },
        "lat_ns" : {
          "min" : 166400,
          "max" : 45278600,
          "mean" : 1873865.770596,
          "stddev" : 1177067.415182
        },
        "bw_min" : 78912,
        "bw_max" : 189912,
        "bw_agg" : 99.872691,
        "bw_mean" : 158478.985311,
        "bw_dev" : 479.817441,
        "bw_samples" : 2969,
        "iops_min" : 9862,
        "iops_max" : 23739,
        "iops_mean" : 19809.355085,
        "iops_stddev" : 59.984869,
        "iops_samples" : 2969
      },
      "write" : {
        "io_bytes" : 4879048704,
        "io_kbytes" : 4764696,
        "bw_bytes" : 162618694,
        "bw" : 158807,
        "iops" : 19850.914909,
        "runtime" : 30003,
        "total_ios" : 595587,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 2900,
          "max" : 8307100,
          "mean" : 12598.084411,
          "stddev" : 25889.882524
        },
        "clat_ns" : {
          "min" : 1500,
          "max" : 44571100,
          "mean" : 626367.372693,
          "stddev" : 1011657.115228,
          "percentile" : {
            "1.000000" : 148480,
            "5.000000" : 175104,
            "10.000000" : 197632,
            "20.000000" : 234496,
            "30.000000" : 276480,
            "40.000000" : 325632,
            "50.000000" : 382976,
            "60.000000" : 460800,
            "70.000000" : 569344,
            "80.000000" : 741376,
            "90.000000" : 1122304,
            "95.000000" : 1728512,
            "99.000000" : 4227072,
            "99.500000" : 5865472,
            "99.900000" : 12779520,
            "99.950000" : 16187392,
            "99.990000" : 31326208
          }
        },
        "lat_ns" : {
          "min" : 98100,
          "max" : 44583700,
          "mean" : 639412.939839,
          "stddev" : 1012520.173103
        },
        "bw_min" : 75308,
        "bw_max" : 206879,
        "bw_agg" : 99.834535,
        "bw_mean" : 158544.230508,
        "bw_dev" : 539.099183,
        "bw_samples" : 2969,
        "iops_min" : 9413,
        "iops_max" : 25859,
        "iops_mean" : 19817.438983,
        "iops_stddev" : 67.393798,
        "iops_samples" : 2969
      },
      "trim" : {
        "io_bytes" : 0,
        "io_kbytes" : 0,
        "bw_bytes" : 0,
        "bw" : 0,
        "iops" : 0.000000,
        "runtime" : 0,
        "total_ios" : 0,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000
        },
        "clat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000,
          "percentile" : {
            "1.000000" : 0,
            "5.000000" : 0,
            "10.000000" : 0,
            "20.000000" : 0,
            "30.000000" : 0,
            "40.000000" : 0,
            "50.000000" : 0,
            "60.000000" : 0,
            "70.000000" : 0,
            "80.000000" : 0,
            "90.000000" : 0,
            "95.000000" : 0,
            "99.000000" : 0,
            "99.500000" : 0,
            "99.900000" : 0,
            "99.950000" : 0,
            "99.990000" : 0
          }
        },
        "lat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000
        },
        "bw_min" : 0,
        "bw_max" : 0,
        "bw_agg" : 0.000000,
        "bw_mean" : 0.000000,
        "bw_dev" : 0.000000,
        "bw_samples" : 0,
        "iops_min" : 0,
        "iops_max" : 0,
        "iops_mean" : 0.000000,
        "iops_stddev" : 0.000000,
        "iops_samples" : 0
      },
      "sync" : {
        "lat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000,
          "percentile" : {
            "1.000000" : 0,
            "5.000000" : 0,
            "10.000000" : 0,
            "20.000000" : 0,
            "30.000000" : 0,
            "40.000000" : 0,
            "50.000000" : 0,
            "60.000000" : 0,
            "70.000000" : 0,
            "80.000000" : 0,
            "90.000000" : 0,
            "95.000000" : 0,
            "99.000000" : 0,
            "99.500000" : 0,
            "99.900000" : 0,
            "99.950000" : 0,
            "99.990000" : 0
          }
        },
        "total_ios" : 0
      },
      "job_runtime" : 1500020,
      "usr_cpu" : 0.847789,
      "sys_cpu" : 1.553179,
      "ctx" : 1190999,
      "majf" : 0,
      "minf" : 738,
      "iodepth_level" : {
        "1" : 100.000000,
        "2" : 0.000000,
        "4" : 0.000000,
        "8" : 0.000000,
        "16" : 0.000000,
        "32" : 0.000000,
        ">=64" : 0.000000
      },
      "iodepth_submit" : {
        "0" : 0.000000,
        "4" : 100.000000,
        "8" : 0.000000,
        "16" : 0.000000,
        "32" : 0.000000,
        "64" : 0.000000,
        ">=64" : 0.000000
      },
      "iodepth_complete" : {
        "0" : 0.000000,
        "4" : 100.000000,
        "8" : 0.000000,
        "16" : 0.000000,
        "32" : 0.000000,
        "64" : 0.000000,
        ">=64" : 0.000000
      },
      "latency_ns" : {
        "2" : 0.000000,
        "4" : 0.000000,
        "10" : 0.000000,
        "20" : 0.000000,
        "50" : 0.000000,
        "100" : 0.000000,
        "250" : 0.000000,
        "500" : 0.000000,
        "750" : 0.000000,
        "1000" : 0.000000
      },
      "latency_us" : {
        "2" : 0.010000,
        "4" : 0.010000,
        "10" : 0.010000,
        "20" : 0.000000,
        "50" : 0.010000,
        "100" : 0.010000,
        "250" : 12.171707,
        "500" : 23.191574,
        "750" : 11.453812,
        "1000" : 7.256127
      },
      "latency_ms" : {
        "2" : 21.386675,
        "4" : 23.017307,
        "10" : 1.336940,
        "20" : 0.154362,
        "50" : 0.029646,
        "100" : 0.000000,
        "250" : 0.000000,
        "500" : 0.000000,
        "750" : 0.000000,
        "1000" : 0.000000,
        "2000" : 0.000000,
        ">=2000" : 0.000000
      },
      "latency_depth" : 1,
      "latency_target" : 0,
      "latency_percentile" : 100.000000,
      "latency_window" : 0
    }
  ],
  "disk_util" : [
    {
      "name" : "sdb",
      "read_ios" : 1461581,
      "write_ios" : 1462019,
      "read_merges" : 0,
      "write_merges" : 50,
      "read_ticks" : 2086340,
      "write_ticks" : 559557,
      "in_queue" : 2646060,
      "util" : 99.298624
    }
  ]
}
```
