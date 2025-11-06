# Cittamaya Marketplace

Claude Code tools for memory management and agent workflows.

## Overview

Cittamaya is a marketplace for Claude Code plugins that enhance agent capabilities with memory management, context preservation, and workflow automation.

## Available Plugins

### Pensieve

Memory recording and retrieval system for Claude Code agents. Enables structured storage and retrieval of significant events, decisions, and context across development sessions.

**What you get:**
- **Skills**: `memory-management` - Comprehensive guidance on using Pensieve effectively
- **Hooks**: Automatic reminders at session start/end and after git commits
- **Integration**: Seamless integration with the Pensieve CLI tool

**Repository**: [pensieve](https://github.com/pradeeproark/pensieve)

## Installation

### Prerequisites

First, install the Pensieve CLI tool:

```bash
# Using Homebrew
brew install pradeeproark/tap/pensieve
```

### Plugin Installation

```bash
# Add the Cittamaya marketplace
/plugin marketplace add cittamaya/cittamaya

# Install the Pensieve plugin
/plugin install pensieve@cittamaya-marketplace
```

That's it! The skills and hooks are now active in your Claude Code environment.

## Usage

Once installed, Claude Code will:

1. **At session start**: Remind you to search Pensieve for relevant memories
2. **During work**: Provide the `memory-management` skill for recording guidance
3. **After git commits**: Prompt you to evaluate if the commit contains recordable learnings
4. **At session end**: Remind you to record any significant learnings

See the [Pensieve plugin README](./pensieve/README.md) for detailed usage instructions.

## Future Plugins

Cittamaya will expand to include additional tools and workflows for Claude Code agents. Stay tuned!

## Local Development

For local testing:

```bash
# Add local marketplace
/plugin marketplace add /path/to/cittamaya

# Install plugin
/plugin install pensieve@cittamaya-marketplace
```

## Support

- **Issues**: [Report issues](https://github.com/cittamaya/cittamaya/issues)
- **Documentation**: [Pensieve docs](https://github.com/pradeeproark/pensieve)

## License

MIT License - see [LICENSE](./LICENSE) for details
