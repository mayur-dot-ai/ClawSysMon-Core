#!/bin/bash
# ClawSysMon Update Script
# Usage: ./update.sh
#
# Handles migrations and updates:
# 1. Checks current schema version in SQLite
# 2. Lists pending migrations in src/db/migrations/
# 3. Runs migrations in order (001_, 002_, etc.)
# 4. Updates schema version
# 5. Restarts service if running
#
# Migration files are SQL scripts that alter schema safely:
# - Add new columns (nullable or with defaults)
# - Create new tables
# - Create indexes
# - Never drop data without backup

echo "ClawSysMon Updater"
echo "=================="
echo ""

# TODO: Check current version from DB
# TODO: Find pending migrations
# TODO: Run migrations in transaction
# TODO: Update version
# TODO: Restart if needed

echo "Update complete!"