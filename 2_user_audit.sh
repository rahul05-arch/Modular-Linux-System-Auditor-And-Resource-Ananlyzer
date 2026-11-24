#!/bin/bash
REPORT_DIR="$HOME/linux_audit_project/reports"
mkdir -p "$REPORT_DIR"
DATE=$(date +%F)
FILE="$REPORT_DIR/user_and_permissions_$DATE.txt"

echo "[2/4] Running User, Group & Permissions Audit..."

echo "=== CURRENTLY LOGGED IN USERS ===" > "$FILE"
who >> "$FILE"

echo -e "\n=== LOCAL SYSTEM ACCOUNTS (Username:UID) ===" >> "$FILE"
cut -d: -f1,3 /etc/passwd >> "$FILE"

echo -e "\n=== SUPERUSER (SUDO/WHEEL) GROUP MEMBERS ===" >> "$FILE"
grep -E "^(sudo|wheel):" /etc/group >> "$FILE"

echo -e "\n=== ROOT PASSWORD AGING POLICY ===" >> "$FILE"
chage -l root >> "$FILE"

echo -e "\n=== ACTIVE SYSTEM UMASK ===" >> "$FILE"
umask >> "$FILE"

echo -e "\n=== STICKY BIT VERIFICATION ON /tmp ===" >> "$FILE"
ls -ld /tmp >> "$FILE"

echo -e "\n=== SUID/SGID PRIVILEGED BINARIES (SAMPLE TOP 15) ===" >> "$FILE"
find /usr/bin -perm /6000 -ls 2> /dev/null | head -n 15 >> "$FILE"

echo " -> Saved user report."
