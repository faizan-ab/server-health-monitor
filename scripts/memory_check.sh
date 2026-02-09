#!/bin/bash

# Load configuration
source /opt/server-health-monitor/health.conf

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Get memory usage percentage
MEM_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

if [ "$MEM_USAGE" -ge "$MEM_THRESHOLD" ]; then
    echo "[$TIMESTAMP] ALERT: Memory usage HIGH - ${MEM_USAGE}%" >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] Memory usage OK - ${MEM_USAGE}%" >> "$LOG_FILE"
fi

