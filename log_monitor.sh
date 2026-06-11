#!/bin/bash

################################################################################
# Script Name:   log_monitor.sh
# Description:   Real-time SSH Brute Force Detector.
# Author:        Isuru Udana Pinthu.
# Date:          2026-02-26
# Version:       1.0
# Usage:         ./log_monitor.sh
################################################################################

echo "=========================================================="
echo "      REAL-TIME SSH INTRUSION DETECTION SYSTEM            "
echo "=========================================================="
echo "[+] Monitoring system logs for Brute Force attacks..."

# Using journalctl to follow SSH logs in real-time
sudo journalctl -u ssh -f | while read LINE; do
    # Looking for 'Failed password' in the live log stream
    if echo "$LINE" | grep -q "Failed password"; then
        echo -e "\e[31m[ALERT]\e[0m Failed login attempt detected!"
        echo "Log Detail: $LINE"
    fi
done
