#!/bin/bash
REPORT_DIR="$HOME/linux_audit_project/reports"
mkdir -p "$REPORT_DIR"
DATE=$(date +%F)
FILE="$REPORT_DIR/system_and_disk_$DATE.txt"

echo "[1/4] Running Kernel & Storage Audit..."

echo "=== KERNEL & OS DISTRIBUTION BASELINE ===" > "$FILE"
uname -a >> "$FILE"
grep "PRETTY_NAME" /etc/os-release >> "$FILE"
echo "Active Shell Environment: $SHELL" >> "$FILE"
echo "System Uptime: $(uptime -p)" >> "$FILE"

echo -e "\n=== BLOCK DEVICES AND PARTITIONS ===" >> "$FILE"
lsblk >> "$FILE"

echo -e "\n=== FILE SYSTEM DISK SPACE USAGE ===" >> "$FILE"
df -h >> "$FILE"

echo " -> Saved storage report."
