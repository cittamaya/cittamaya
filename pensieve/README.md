# Pensieve Plugin for Claude Code

Memory management for Claude Code agents - structured recording and retrieval across development sessions.

## What is Pensieve?

Pensieve is a memory recording tool that enables Claude Code agents to:
- Record significant learnings, decisions, and patterns
- Search and retrieve memories from previous sessions
- Maintain context across conversation boundaries
- Build a curated knowledge base for each project

This plugin provides Claude Code integration through skills and hooks.

## Prerequisites

**You must install the Pensieve CLI tool first:**

**Requirements**: Pensieve CLI >=0.1.0

**macOS** (via Homebrew):
```bash
brew tap pradeeproark/pensieve
brew install pensieve

# Verify installation
pensieve --version  # Should show 0.1.0 or higher
```

**Linux/Windows**: Coming soon. See [GitHub releases](https://github.com/pradeeproark/pensieve/releases) for manual binary downloads.

The plugin provides the Claude Code integration (skills and hooks), but requires the Pensieve tool to be installed separately.

## Installation

```bash
# Add the Cittamaya marketplace
/plugin marketplace add cittamaya/cittamaya

# Install the Pensieve plugin
/plugin install pensieve@cittamaya-marketplace
```

## What You Get

### Skills

**`memory-management`**
- Comprehensive guidance on using Pensieve effectively
- When and what to record (3-question rubric)
- Non-disruptive recording with subagents
- Memory retrieval workflows
- Best practices and anti-patterns

### Hooks

**Session Start** - Mandatory protocol reminder
- Fires when session starts or resumes
- Reminds Claude to search for existing memories
- Prevents re-discovering solutions

**Session End** - Recording reminder
- Fires when session ends
- Prompts to record any significant learnings
- Captures insights before context is lost

**Git Commit** - Learning evaluation
- Fires after `git commit` commands
- Applies 3-question rubric to evaluate if commit should be recorded
- Encourages capturing valuable patterns

## Usage

### Automatic Workflows

Once installed, Claude Code will automatically:

1. **At session start**: Search Pensieve and show existing memories
2. **During development**: Use memory-management skill for guidance
3. **After commits**: Evaluate and optionally record learnings
4. **At session end**: Remind to capture final insights

### Manual Commands

You can also invoke the skill manually:

```
Use the memory-management skill
```

Or search for memories directly:

```bash
pensieve entry search
pensieve entry search --template problem_solved
pensieve entry show <entry-id>
```

## Common Templates

Create these templates for effective memory management:

- `problem_solved` - Non-obvious bugs and their solutions
- `pattern_discovered` - Architectural patterns and conventions
- `workaround_learned` - Tool issues and workarounds
- `resource_found` - Valuable documentation and references
- `project_decision` - Key decisions and their rationale

See the [Pensieve tool documentation](https://github.com/pradeeproark/pensieve) for template creation and management.

## Troubleshooting

### Plugin not loading

```bash
# Check plugin status
/plugin list

# Reinstall if needed
/plugin remove pensieve
/plugin install pensieve@cittamaya-marketplace
```

### Pensieve command not found

Ensure the CLI tool is installed:

```bash
# macOS
brew tap pradeeproark/pensieve
brew install pensieve

# Verify
pensieve --version
```

### Hooks not firing

Check Claude Code settings:

```bash
# Hooks should appear in ~/.claude/settings.json
cat ~/.claude/settings.json | grep pensieve
```

## Documentation

- **Pensieve Tool**: [github.com/pradeeproark/pensieve](https://github.com/pradeeproark/pensieve)
- **Skill Details**: See `skills/memory-management/SKILL.md`
- **Hook Details**: See `hooks/README.md`

## Support

- **Issues**: [Report issues](https://github.com/cittamaya/cittamaya/issues)
- **Tool Issues**: [Report to pensieve repo](https://github.com/pradeeproark/pensieve/issues)

## License

MIT License
