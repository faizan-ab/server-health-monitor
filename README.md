# Automated Server Health Monitoring & Auto-Cleanup

## 📌 Project Overview
This project automates Linux server health monitoring by tracking CPU, memory, and disk usage.
It also performs automatic cleanup of old log files when disk usage exceeds defined thresholds.

## 🛠 Tools & Technologies
- Linux
- Bash Scripting
- Cron
- System Monitoring Commands (top, free, df)

## ⚙️ Features
- CPU usage monitoring
- Memory usage monitoring
- Disk usage monitoring
- Threshold-based alerts
- Automatic log cleanup
- Cron-based automation

## 📂 Project Structure
/opt/server-health-monitor
├── health.conf
├── scripts
│ ├── cpu_check.sh
│ ├── memory_check.sh
│ ├── disk_check.sh
│ └── health_check.sh
└── logs


## ⏰ Cron Job
The health check runs every 5 minutes:
*/5 * * * * /opt/server-health-monitor/scripts/health_check.sh

#Explanation
In real environments, servers can fail due to high CPU, memory, or disk usage.
This project proactively monitors system health and prevents disk-full issues using automation.
