#!/bin/bash
REPORT_DIR="$HOME/linux_audit_project/reports"
mkdir -p "$REPORT_DIR"
DATE=$(date +%F)
MASTER_REPORT="$REPORT_DIR/master_audit_report_$DATE.txt"
SHORTCUT_LINK="$REPORT_DIR/latest_audit_report.txt"

echo "[4/4] Combining All Reports & Verifying Inodes..."

if cat "$REPORT_DIR/system_and_disk_$DATE.txt" \
       "$REPORT_DIR/user_and_permissions_$DATE.txt" \
       "$REPORT_DIR/network_and_services_$DATE.txt" > "$MASTER_REPORT"; then
    echo " -> Consolidated Master Report created: $MASTER_REPORT"
else
    echo "Error: Failed to merge report files."
    exit 1
fi

ln -sf "$MASTER_REPORT" "$SHORTCUT_LINK"

echo -e "\n--- Inode and Soft Link Verification ---"
ls -li "$MASTER_REPORT" "$SHORTCUT_LINK"
