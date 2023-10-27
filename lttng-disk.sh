#!/bin/bash

lttng create $1
lttng enable-event -k --syscall open,write,read,close
lttng enable-event -k sched_switch,sched_wak'*',irq_'*',block_rq'*'
lttng add-context -k -t vtid -t vpid -t procname -t prio
lttng start
sleep 10
lttng stop
lttng destroy
