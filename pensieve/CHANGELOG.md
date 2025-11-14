# Changelog

All notable changes to the Pensieve plugin will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2025-11-14

### Added
- Version update check in memory-management skill
  - Compares installed version against minimum required (>=0.1.0)
  - Gentle nudging with upgrade instructions but allows continuation
  - References README for authoritative version requirements
- Custom commands for explicit memory management:
  - `/pensieve:remember [context]` - Record learnings with optional context
  - `/pensieve:recall [context]` - Search memories with optional context
  - Both commands invoke memory-management skill with appropriate guidance
- "Memory Management Commands" section in README with usage examples

### Changed
- Enhanced SKILL.md with CLI installation detection and graceful degradation
- Updated documentation to reference README instead of duplicating installation instructions

## [1.0.0] - 2024-11-XX

### Added
- Initial release of Pensieve plugin for Claude Code
- memory-management skill with comprehensive guidance
- SessionStart hook for mandatory memory search protocol
- PostToolUse hook for git commit evaluation
- Field design principles and best practices
- Tag selection and linking guidelines
