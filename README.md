# MT4 Terminal Docker Image

## Problem

Metatrader4 terminal works correctly under wine in a linux server environment with Xvfb as the X server. 

Tested on Ubuntu 17.10 Server. 

However it fails when started in a Docker container (again Ubuntu 17.10).

Issue:

```bash
err:winhttp:netconn_secure_connect send failed
```



## Objective

Find the fix, so mt4 terminal starts and executes Expert Advisor sample_ea.



## Setup

* Create an Metatrader4 demo account with Pepperstone.
* Update `terminal/start.ini` with the demo account details.
* Build docker image



## Validation

How to validate that it started correctly?

 Container file `/u00/logs/<date>.log` will have the following entry:

```bash
0	19:57:17.918	Started with configuration file 'start.ini'
2	19:57:19.617	Expert sample_ea EURUSD,H4: loaded successfully
```



Check:

```bash
docker exec -ti mt4u tail -f /u00/logs/$(date +%Y%m%d).log
```



**Obs!** In the current state the app starts, but does not start the expert advisor script (sample_ea) correctly:

```bash
# docker exec -ti mt4u tail -f /u00/logs/$(date +%Y%m%d).log
0	08:50:22.003	Migration: mailbox folder copied from 'Z:\u00' to 'Z:\u00'
0	08:50:22.004	Migration: profiles folder copied from 'Z:\u00' to 'Z:\u00'
0	08:50:22.005	Migration: templates folder copied from 'Z:\u00' to 'Z:\u00'
0	08:50:22.048	MetaTrader build 1090 started (Pepperstone Group Limited)
0	08:50:22.049	Microsoft Windows XP (X86 based PC), IE 09.00, 4 x Intel Pentium 4  2.40GHz, RAM: 1736 / 1998 Mb, HDD: 51143 / 60445 Mb, GMT+00:00
0	08:50:22.049	Data Folder: Z:\u00
0	08:50:22.351	Sources recompilation started
3	08:50:22.351	Compiler: you must to update the MetaEditor
0	08:50:22.352	Sources recompilation finished (1 compiled in 6 msec)
0	08:50:22.353	Started with configuration file 'start.ini'
```

