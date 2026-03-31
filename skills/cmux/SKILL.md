---
name: cmux
description: "Use this skill when the user asks about cmux, mentions cmux terminal, asks about cmux configuration, keyboard shortcuts, custom commands, notifications, browser automation, the cmux API, cmux split panes, cmux vertical tabs, cmux workspaces, or Claude Code agent teams in cmux. Also use when the user asks about a native macOS terminal for AI coding agents built on Ghostty, or references cmux.com documentation."
allowed-tools: [WebFetch]
---

# cmux Documentation Skill

## Overview

cmux is a native macOS terminal application built on Ghostty (libghostty),
designed for developers running multiple AI coding agents simultaneously.
Key features include vertical tabs, notification rings, split panes, an
embedded browser, and a Unix socket API for automation. It is
GPU-accelerated, built with Swift and AppKit (no Electron), and is free
and open-source.

- **GitHub**: https://github.com/manaflow-ai/cmux
- **Website**: https://cmux.com

## Documentation URL Reference

When answering questions about cmux, fetch the relevant documentation page
from cmux.com using WebFetch. Select the most relevant URL based on the
user's question:

| Topic | URL |
|---|---|
| Installation and setup | https://cmux.com/docs/getting-started |
| Core concepts (windows, workspaces, panes, surfaces) | https://cmux.com/docs/concepts |
| Configuration (Ghostty config) | https://cmux.com/docs/configuration |
| Keyboard shortcuts | https://cmux.com/docs/keyboard-shortcuts |
| Custom commands and workspace layouts | https://cmux.com/docs/custom-commands |
| CLI and Unix socket API | https://cmux.com/docs/api |
| Notifications and alerts | https://cmux.com/docs/notifications |
| Browser automation | https://cmux.com/docs/browser-automation |
| Claude Code agent teams | https://cmux.com/docs/claude-code-teams |
| Changelog and version history | https://cmux.com/docs/changelog |
| Blog posts and news | https://cmux.com/blog |
| General overview | https://cmux.com |

## How to Answer

1. Identify which documentation page is most relevant to the user's question
   from the table above. If the topic spans multiple pages, fetch the most
   specific one first.
2. Use WebFetch to retrieve the page content. Craft a targeted prompt that
   extracts the specific information the user asked about. For example:
   - Keyboard shortcuts -> fetch keyboard-shortcuts page with a prompt like
     "List all keyboard shortcuts and their descriptions"
   - Configuration -> fetch configuration page targeting the specific setting
   - API usage -> fetch api page with "List available commands with parameters
     and examples"
3. Synthesize the fetched content into a clear, direct answer. Do not dump
   raw fetched content -- extract the relevant parts and present them in a
   helpful format.
4. If the fetched page does not contain the answer, try fetching a different
   relevant page from the table.
5. For simple questions like "what is cmux?", answer from the overview above
   without fetching, unless the user asks for more details.

## Response Format

- Provide concise, actionable answers
- Include relevant code snippets, configuration examples, or keyboard
  shortcuts when applicable
- Link to the source documentation page so the user can read more
- If the documentation does not cover the user's question, state this clearly
  rather than speculating
