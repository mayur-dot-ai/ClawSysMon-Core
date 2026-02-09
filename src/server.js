/**
 * ClawSysMon Server Entry Point
 * 
 * Express + Socket.IO backend that:
 * - Serves static React app
 * - Provides REST API for file/config operations
 * - Streams real-time events via Socket.IO
 * - Monitors OpenClaw process and files
 * 
 * Architecture:
 * - Runs continuously (24/7) even without browser connected
 * - All intelligence here - frontend is dumb viewer
 * - SQLite for all data persistence
 * - Chokidar for file watching
 */

const express = require('express');
const { createServer } = require('http');
const { Server } = require('socket.io');
require('dotenv').config();

const app = express();
const httpServer = createServer(app);
const io = new Server(httpServer);

// TODO: Initialize database connection
// TODO: Start file watcher service
// TODO: Start process monitor service
// TODO: Set up API routes
// TODO: Set up Socket.IO event handlers
// TODO: Serve static files

const PORT = process.env.PORT || 3000;

httpServer.listen(PORT, () => {
  console.log(`ClawSysMon running on port ${PORT}`);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  console.log('SIGTERM received, shutting down gracefully');
  // TODO: Close DB connection
  // TODO: Stop file watchers
  process.exit(0);
});