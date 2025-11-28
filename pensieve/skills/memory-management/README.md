# Memory Management Skill

This directory contains the **memory-management** skill for Claude Code, which guides effective use of the Pensieve memory system.

## Overview

The memory-management skill provides:
- Mandatory protocols for searching and recording memories
- 3-question rubric for deciding what to record
- Anti-rationalization warnings to prevent skipping steps
- Evidence-before-claims enforcement
- Integration with Pensieve CLI

## Files

- **SKILL.md** - Main skill definition (auto-loaded by Claude Code)
- **TEST_SCENARIOS.md** - Test scenarios for validating the skill
- **EXAMPLE_SETTINGS.json** - Example Claude Code settings with hooks configured
- **README.md** - This file

## Deployment

This skill is distributed via the **Claude Code plugin system** as part of the Pensieve plugin.

### For Users

Install via the plugin marketplace:
```bash
/plugin marketplace add cittamaya/cittamaya
/plugin install pensieve@cittamaya-marketplace
```

The plugin system automatically manages skill deployment. No manual installation needed.

### For Plugin Developers

**Source location**: This repo (`cittamaya/pensieve/skills/memory-management/`)

**Deployment process**:
1. Make changes to skill files in this repo
2. Test by having users update plugin: `/plugin update pensieve@cittamaya-marketplace`
3. Commit changes to repo when satisfied
4. Plugin system handles distribution to users automatically

**Version Control**:
- **Source of truth**: This repo (`skills/memory-management/`)
- **Deployed by**: Claude Code plugin system
- **Updates via**: `/plugin update` command
- **DO NOT** manually edit files in user's `~/.claude/` directory - managed by plugin system

## Recent Changes

See git history for this directory:
```bash
git log --oneline .claude/skills/memory-management/
```

## Integration with Hooks

This skill works best with the Pensieve hooks, which are automatically installed by the plugin. The 2-hook system provides:
- **Session start**: MANDATORY protocol requiring memory search before starting work
- **Git commits**: Prompts to evaluate if commit contains recordable learnings using 3-question rubric

The plugin system automatically installs and manages hooks. See `hooks/README.md` for complete documentation.

## Testing

See `TEST_SCENARIOS.md` for test cases to verify the skill works correctly.

## Recent Updates

**November 2025 - Simplified & Flexible**:
- Removed detailed template examples and field specifications
- Added "Discovering Pensieve Capabilities" section pointing to `--help`
- Removed hook-specific workflows (Part 2.5)
- Kept core: 3-question rubric, subagent templates, protocols, anti-rationalizations
- Result: ~780 lines removed, more flexible for Pensieve changes

**October 2025 - Superpowers Enforcement**:
- Mandatory protocols (not suggestions)
- Evidence requirements (must show search output)
- Explicit rubric evaluation (silent evaluation = no evaluation)
- Anti-rationalization warnings (13 common failure patterns)

This skill uses enforced processes with verification gates rather than optional suggestions.
