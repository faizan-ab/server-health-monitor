#!/bin/bash

source /opt/server-health-monitor/health.conf
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] ALERT: Server health threshold crossed. Check health.log"
