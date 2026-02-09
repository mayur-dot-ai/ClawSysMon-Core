-- Migration: 002_add_pro_tables.sql
-- Adds tables for Pro features (Projects, Kanban, Agents)

-- Projects table
CREATE TABLE IF NOT EXISTS projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tasks table (Kanban)
CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER REFERENCES projects(id),
    title TEXT NOT NULL,
    description TEXT,
    status TEXT DEFAULT 'backlog', -- 'backlog', 'blocker', 'todo', 'doing', 'done'
    priority INTEGER DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_tasks_project ON tasks(project_id);
CREATE INDEX IF NOT EXISTS idx_tasks_status ON tasks(status);

-- Agents table (custom agent definitions)
CREATE TABLE IF NOT EXISTS agents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    model TEXT,
    system_prompt TEXT,
    tools JSON,           -- Array of allowed tool IDs
    project_id INTEGER REFERENCES projects(id), -- NULL = system-wide
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Update version
INSERT INTO schema_version (version) VALUES (2);