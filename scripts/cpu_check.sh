#!/bin/bash

# Load configuration
source /opt/server-health-monitor/health.conf

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Get CPU usage (100 - idle)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

CPU_USAGE_INT=${CPU_USAGE%.*}

if [ "$CPU_USAGE_INT" -ge "$CPU_THRESHOLD" ]; then
    echo "[$TIMESTAMP] ALERT: CPU usage HIGH - ${CPU_USAGE_INT}%" >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] CPU usage OK - ${CPU_USAGE_INT}%" >> "$LOG_FILE"
fi
