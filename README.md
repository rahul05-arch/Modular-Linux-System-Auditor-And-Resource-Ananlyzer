# linux-modular-audit

A lightweight, offline bash framework for automating Linux system, network, and security audits. Uses native utilities (`lsblk`, `ip`, `systemctl`) across 5 modular scripts to generate date-stamped, consolidated reports. Ideal for lab execution and security baselines without third-party dependencies.

## Usage
Make the scripts executable and run the master controller as root:
```bash
chmod +x *.sh
sudo ./start_audit.sh
```
