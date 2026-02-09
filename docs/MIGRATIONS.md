# Database Migrations

## Overview

Migrations handle schema changes over time without losing data.

## How It Works

1. Migration files stored in `src/db/migrations/`
2. Named sequentially: `001_`, `002_`, etc.
3. `update.sh` runs pending migrations
4. `schema_version` table tracks current version

## Running Migrations

```bash
./update.sh
```

## Creating a Migration

1. Create new file: `src/db/migrations/003_add_user_table.sql`
2. Write SQL to alter schema safely
3. Add version insert at end

### Safe Operations
- `CREATE TABLE` - New tables
- `ALTER TABLE ADD COLUMN` - New columns (nullable or with default)
- `CREATE INDEX` - Indexes
- `INSERT` - Seed data

### Unsafe Operations (Avoid)
- `DROP TABLE` - Loses data
- `DROP COLUMN` - Loses data
- `ALTER COLUMN` - May fail on existing data

## Example Migration

```sql
-- Migration: 003_add_user_prefs.sql
-- Adds user preferences table

CREATE TABLE IF NOT EXISTS user_prefs (
    user_id TEXT PRIMARY KEY,
    theme TEXT DEFAULT 'dark',
    notifications BOOLEAN DEFAULT true
);

INSERT INTO schema_version (version) VALUES (3);
```

## Troubleshooting

If migration fails:
1. Check `logs/migration.log`
2. Database remains in previous state (transaction rollback)
3. Fix migration file and re-run