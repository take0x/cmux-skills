---
name: pane
description: "Read, check, or re-check terminal pane output via cmux. Triggered by any mention of a pane — reading, listing, inspecting, debugging, or re-checking after a previous read (e.g., still failing, not fixed yet, check again, is it done)."
argument-hint: "[pane-number] [last]"
allowed-tools: [Bash]
---

# /pane

Read terminal pane output using cmux.

## Prerequisites

The `cmux` command must be installed and available in PATH. This skill is
designed for use with the cmux terminal multiplexer.

## Arguments

The user invoked this with: $ARGUMENTS

Arguments can be:
- Empty: list available panes
- `<number>`: read full content from that pane
- `<number> last`: read only the last command and its output from that pane

## Choosing the Read Mode

Based on the user's intent, choose one of two modes:

- **Full read**: The user wants to see all pane content (e.g., "read pane 1",
  "show me pane 2"). Use the full read method.
- **Last command only**: The user asks about an error, a result, or what was
  executed (e.g., "check the error in pane 2", "what did pane 1 run?",
  "debug pane 3"). Use the last command extraction method — it is more
  focused and avoids unnecessary noise.

## Instructions

1. If `$ARGUMENTS` is empty or not provided, list available panes:

   ```bash
   cmux list-panes
   ```

   Show the results and let the user know they can run `/pane <number>` to
   read a specific pane, or `/pane <number> last` for the last command only.

2. If a pane number is provided **without** `last`, read the full content:

   ```bash
   SKILL_DIR="${CLAUDE_SKILL_DIR:-.}" && ${SKILL_DIR}/scripts/read-pane.sh N
   ```

   Replace `N` with the pane number from `$ARGUMENTS`.

3. If a pane number is provided **with** `last`, extract only the last
   command and its output:

   ```bash
   SKILL_DIR="${CLAUDE_SKILL_DIR:-.}" && ${SKILL_DIR}/scripts/read-pane.sh N last
   ```

   Replace `N` with the pane number.

4. Show the output in a fenced code block.

## Error Handling

- **cmux not found**: Inform the user that cmux must be installed.
- **SURFACE is empty** (no `[selected]` surface found): The pane number is
  likely invalid. Run `cmux list-panes` and show available panes.
- **Empty output**: Report that the pane has no visible content.

## Response Guidelines

- Show the pane content in a fenced code block.
- If the user asked a specific question about the pane (e.g., "is there an
  error in pane 2?"), analyze the output and answer their question directly
  rather than just showing the raw output.
- If the user said "read pane" without a number, list available panes first
  and ask which one to read.

## Examples

- `/pane` -- list all available panes
- `/pane 2` -- read full content from pane 2
- `/pane 2 last` -- read only the last command and output from pane 2
