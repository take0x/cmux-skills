# cmux-skills

Agent Skills for [cmux](https://cmux.com), a native macOS terminal for AI coding agents.

## Skills

### cmux — Documentation Lookup

Automatically answers questions about cmux by combining local CLI help (`cmux -h`) with live documentation from [cmux.com](https://cmux.com). CLI-related questions (subcommands, flags, syntax) use the locally installed `cmux` help output for accuracy, while conceptual topics (configuration, shortcuts, teams) are fetched from cmux.com. Triggers when you mention cmux features, configuration, keyboard shortcuts, API, etc.

### pane — Pane Reader

Reads terminal output from other cmux panes. Useful for checking build logs, test results, or server output without leaving your current pane.

**Slash command:**

```
/pane              # List available panes
/pane 2            # Read full content from pane 2
/pane 2 last       # Read only the last command and its output from pane 2
```

**Natural language:**

- "Read pane 2"
- "What's in pane 1?"
- "Check pane 3 for errors"
- "Still failing in pane 2"

## Prerequisites

- [cmux](https://cmux.com) must be installed and available in your PATH (required for the pane skill).

## Installation

```bash
npx skills add take0x/cmux-skills
```

## Local Development

```bash
claude --plugin-dir .
```

## License

MIT
