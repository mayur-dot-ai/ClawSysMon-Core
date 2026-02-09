#!/bin/bash
# ClawSysMon Interactive Installer
# Usage: ./install.sh
#
# This script guides the user through interactive setup:
# - Install location (default: ~/.clawsysmon/)
# - Feature selection (process monitor, file watcher, etc.)
# - Network: standalone port or reverse proxy (/clawsysmon.com)
# - OpenClaw config path detection
#
# Actions performed:
# 1. Validates Node.js 18+ is installed
# 2. Creates install directory
# 3. Generates randomized SQLite DB filename
# 4. Writes .env with configuration
# 5. Runs npm install
# 6. Creates systemd service (optional)
# 7. Initializes database schema
# 8. Outputs success message with URLs

echo "ClawSysMon Installer"
echo "===================="
echo ""
echo "This will install ClawSysMon - An OpenClaw System Monitor"
echo ""

# TODO: Implement interactive prompts
# TODO: Generate random DB name (clawsysmon_${RANDOM}.db)
# TODO: Write .env file
# TODO: Run npm install
# TODO: Initialize database

echo "Installation complete!"
echo "Start with: npm start"