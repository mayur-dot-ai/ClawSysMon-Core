/**
 * OpenClaw Integration Service
 * 
 * Interfaces with OpenClaw Gateway:
 * - Reads OpenClaw config
 * - Lists agents via Gateway API
 * - Lists skills
 * - Checks version/upgrade availability
 */

class OpenClawService {
  constructor(configPath) {
    this.configPath = configPath;
  }

  async getConfig() {
    // TODO: Read and parse ~/.openclaw/openclaw.json
  }

  async getAgents() {
    // TODO: Query Gateway for agent list
  }

  async getSkills() {
    // TODO: Parse skills from workspace and system
  }

  async checkVersion() {
    // TODO: Check current version
    // TODO: Check GitHub releases for upgrades
  }

  async getDiskUsage() {
    // TODO: Calculate size of ~/.openclaw/
  }
}

module.exports = OpenClawService;