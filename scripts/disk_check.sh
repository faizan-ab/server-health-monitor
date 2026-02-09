#!/bin/bash

# Load configuration
source /opt/server-health-monitor/health.conf

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Get disk usage percentage of root filesystem
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "[$TIMESTAMP] ALERT: Disk usage HIGH - ${DISK_USAGE}%" >> "$LOG_FILE"

    echo "[$TIMESTAMP] Starting auto-cleanup of old log files" >> "$LOG_FILE"

    # Delete log files older than 7 days
    find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \;

    echo "[$TIMESTAMP] Auto-cleanup completed" >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] Disk usage OK - ${DISK_USAGE}%" >> "$LOG_FILE"
fi
