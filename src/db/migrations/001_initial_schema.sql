-- Migration: 001_initial_schema.sql
-- Creates initial tables for ClawSysMon Core

-- Schema version tracking
CREATE TABLE IF NOT EXISTS schema_version (
    version INTEGER PRIMARY KEY,
    applied_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Settings table (user preferences, dashboard config)
CREATE TABLE IF NOT EXISTS settings (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Events table (file changes, agent actions, config updates)
CREATE TABLE IF NOT EXISTS events (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    type TEXT NOT NULL,           -- 'file_change', 'agent_action', 'config_update', etc.
    source TEXT NOT NULL,         -- 'user', 'agent', 'system'
    data JSON,                    -- Event-specific data
    file_path TEXT,               -- For file events
    attribution TEXT              -- Who made the change
);

CREATE INDEX IF NOT EXISTS idx_events_timestamp ON events(timestamp);
CREATE INDEX IF NOT EXISTS idx_events_type ON events(type);

-- Insert initial version
INSERT OR IGNORE INTO schema_version (version) VALUES (1);