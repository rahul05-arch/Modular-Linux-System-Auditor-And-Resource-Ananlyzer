#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this master script with sudo (sudo ./start_audit.sh)"
  exit 1
fi

REPORT_DIR="$HOME/linux_audit_project/reports"
mkdir -p "$REPORT_DIR"

echo "===================================================="
echo "   STARTING MODULAR LINUX SYSTEM AUDIT              "
echo "===================================================="

./1_storage_audit.sh
./2_user_audit.sh
./3_network_audit.sh
./4_merge_reports.sh

echo "===================================================="
echo "   ALL AUDITS COMPLETED SUCCESSFULLY!               "
echo "   View Full Report: cat $REPORT_DIR/latest_audit_report.txt"
echo "===================================================="
