#!/bin/bash
REPORT_DIR="$HOME/linux_audit_project/reports"
mkdir -p "$REPORT_DIR"
DATE=$(date +%F)
FILE="$REPORT_DIR/network_and_services_$DATE.txt"

echo "[3/4] Running Network & Boot Services Audit..."

echo "=== ACTIVE IPv4 ADDRESSES ===" > "$FILE"
ip -4 addr show | grep "inet" >> "$FILE"

echo -e "\n=== DEFAULT ROUTING TABLE ===" >> "$FILE"
ip route | grep "default" >> "$FILE"

echo -e "\n=== CRITICAL NETWORK SERVICES ENABLED AT BOOT ===" >> "$FILE"
systemctl list-unit-files --type=service --state=enabled 2> /dev/null | grep -E "ssh|network|ufw|cron" >> "$FILE"

echo -e "\n=== DNS CONFIGURATION (/etc/resolv.conf) ===" >> "$FILE"
grep -v "^#" /etc/resolv.conf 2> /dev/null >> "$FILE"

echo " -> Saved network report."
