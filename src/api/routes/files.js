/**
 * Files API Routes
 * 
 * GET /api/files/list - List files in workspace/memory
 * GET /api/files/read - Read file content
 * POST /api/files/write - Write file (with lock check)
 * GET /api/files/search - Search files (BM25 + vector)
 */

const express = require('express');
const router = express.Router();

// TODO: Implement file CRUD operations
// TODO: Implement file locking (5-second timeout)
// TODO: Implement attribution tracking
// TODO: Implement search (native + vector)

module.exports = router;