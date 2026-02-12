#!/bin/bash
###################################################
#Author: Rohit Sandeep Shinde
#Date: 12 Feb 2026
#This script gives you the output of Node Health
#Version: 1.0
###################################################
#it exits the script if there is any error
set -e
#for pipeline to check all
set -o pipefail

#Thresholds
Disk_Threshold=80
Mem_Threshold=75
CPU_Threshold=75

LOG_FILE=monitor.log

echo "============= Syatem monitoring report ==================="
echo "Date=$(date)"
echo "----------------------------------------------------------"

#To Monitor disk usage and display warnings beyond a defined threshold
Disk_Usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Disk_Usage=${Disk_Usage}%"

if [ "$Disk_Usage" -gt "$Disk_Threshold" ]; then
        echo "ALERT: Disk usage exceeded threshold!" | tee -a $LOG_FILE
fi

#To Monitor memory usage and alert when usage is high
Mem_Usage=$(free | awk '/Mem:/ {printf("%.0f\n", ($3)/$2 * 100)}')

#In above command we have used "%.0f\n" because it formats number in floating point in 0 decimal place means gives output in whole number and \n is to print output in next line if you want exact number use command as Mem_Usage=$(free | awk '/Mem:/ {printf("%f\n", ($3)/$2 * 100)}')

echo "Memory Usage: ${Mem_Usage}%"

if [ "$Mem_Usage" -gt "$Mem_Threshold" ]; then
        echo "ALERT: Memory usage exceeded threshold!" | tee -a $LOG_FILE
fi

#To check CPU Utilization of server
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d. -f1)

echo "CPU Usage: ${CPU_USAGE}%"

if [ "$CPU_USAGE" -gt "$CPU_Threshold" ]; then
        echo "ALERT: CPU usage exceeded threshold!" | tee -a $LOG_FILE
fi

### TOP PROCESSES ###
echo "-------------------------------------"
echo "Top 5 CPU Consuming Processes:"
ps aux --sort=-%cpu | head -6

echo "-------------------------------------"
echo "Top 5 Memory Consuming Processes:"
ps aux --sort=-%mem | head -6

echo "===== Monitoring Completed ====="
