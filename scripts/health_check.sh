#!/bin/bash

# Run all health checks
/opt/server-health-monitor/scripts/cpu_check.sh
/opt/server-health-monitor/scripts/memory_check.sh
/opt/server-health-monitor/scripts/disk_check.sh
