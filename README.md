# system-monitoring-script
📌 1. Project Overview

This project demonstrates a basic system monitoring automation script written in Bash. It monitors disk usage, memory usage, CPU usage and displays alerts when thresholds are crossed. It also displays top resource-consuming processes.

📌 2. Features

Disk usage monitoring,
Memory usage monitoring,
CPU usage monitoring,
Threshold-based alert system,
Logging to monitor.log,
Display of top 5 CPU consuming processes,
Display of top 5 memory consuming processes.

📌 3. Threshold Configuration

Disk_Threshold=80,
Mem_Threshold=75,
CPU_Threshold=80.

📌 4. How to Run

git clone <repo-url>
cd system-monitoring-script
chmod +x system_monitor.sh
./system_monitor.sh

📌 5. Sample Output

============= Syatem monitoring report ===================
Date=Thu Feb 12 11:46:52 AM UTC 2026
----------------------------------------------------------
Disk_Usage=14%
Memory Usage: 11%
CPU Usage: 6%
-------------------------------------
Top 5 CPU Consuming Processes:
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
admin       1814 75.0  0.1  10884  4480 pts/0    R+   11:46   0:00 ps aux --sort=-%cpu
admin       1815 33.3  0.0   5696  1792 pts/0    S+   11:46   0:00 head -6
admin       1800  2.6  0.0   7340  3584 pts/0    S+   11:46   0:00 /bin/bash ./system_monitor.sh
admin       1128  1.8  0.1  15124  6960 ?        S    09:43   2:19 sshd: admin@pts/0
root        1720  1.0  0.0      0     0 ?        I    11:40   0:04 [kworker/1:1-events]
-------------------------------------
Top 5 Memory Consuming Processes:
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         876  0.0  1.0 601520 42996 ?        Ssl  09:41   0:03 /usr/libexec/fwupd/fwupd
root         356  0.1  0.6 288988 26880 ?        SLsl 09:40   0:09 /sbin/multipathd -d -s
root         654  0.0  0.5 109680 22784 ?        Ssl  09:40   0:00 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
root         322  0.0  0.3  50436 16000 ?        S<s  09:40   0:01 /usr/lib/systemd/systemd-journald
root         630  0.0  0.3 468968 13440 ?        Ssl  09:40   0:00 /usr/libexec/udisks2/udisksd
===== Monitoring Completed =====

