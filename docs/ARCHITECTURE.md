# ClawSysMon Architecture

## Overview

ClawSysMon is a Node.js + Express backend with a React frontend, designed to monitor and manage OpenClaw installations.

## Key Principles

1. **Backend is the Brain**: Runs 24/7 independently of browser connections
2. **Frontend is Dumb**: Just displays data; all intelligence server-side
3. **Everything in SQLite**: Minimal files on disk, all data in database
4. **Survives OpenClaw Crashes**: Dashboard keeps running even if OpenClaw dies

## Architecture Diagram

```
┌─────────────────┐      ┌──────────────────┐      ┌─────────────────┐
│   Browser       │      │   Node.js        │      │   Filesystem    │
│   (React SPA)   │◄────►│   Backend        │◄────►│   + SQLite      │
│                 │ WS   │                  │      │                 │
└─────────────────┘      └──────────────────┘      └─────────────────┘
                                │
                                ▼
                         ┌──────────────┐
                         │  OpenClaw    │
                         │  (monitored) │
                         └──────────────┘
```

## Services

### FileWatcher (Chokidar)
- Monitors /memory, /workspace, config files
- Emits events via Socket.IO
- Logs all changes to SQLite

### ProcessMonitor
- Polls OpenClaw PID every 5-10 seconds
- Provides Online/Offline status
- Shows last seen time

### OpenClawService
- Reads OpenClaw config
- Lists agents and skills
- Checks for upgrades

## Data Flow

1. File changes on disk
2. Chokidar detects change
3. Write to SQLite (events table)
4. Socket.IO broadcasts to browsers
5. Browser updates UI (if connected)

## Database Schema

See `src/db/migrations/` for full schema.

Key tables:
- `settings`: User preferences
- `events`: Event stream history
- `projects`: Pro feature - project definitions
- `tasks`: Pro feature - kanban tasks
- `agents`: Pro feature - custom agents

## API Structure

RESTful API under `/api/`:
- `/api/status` - System status
- `/api/config` - Config file CRUD
- `/api/files` - File operations
- `/api/events` - Event stream

## Security

- v1.0: No built-in auth (relies on SSH tunnel)
- v2.0: Full E2EE database encryption

## Reverse Proxy

Recommended setup with Caddy/Nginx:
- `/` → OpenClaw Gateway
- `/clawsysmon.com` → ClawSysMon