#!/bin/bash
# Usage: read-pane.sh <pane-number> [last]
# Reads terminal output from the specified cmux pane.
# With "last", extracts only the last command and its output.

set -euo pipefail

PANE_NUM="${1:-}"
MODE="${2:-full}"

if [ -z "$PANE_NUM" ]; then
  echo "Usage: read-pane.sh <pane-number> [last]" >&2
  exit 1
fi

SURFACE=$(cmux list-pane-surfaces --pane "pane:$PANE_NUM" 2>/dev/null | grep '\[selected\]' | grep -o 'surface:[^ ]*')

if [ -z "$SURFACE" ]; then
  echo "Error: No selected surface found for pane $PANE_NUM" >&2
  echo "Available panes:" >&2
  cmux list-panes >&2
  exit 1
fi

if [ "$MODE" = "last" ]; then
  OUTPUT=$(cmux read-screen --surface "$SURFACE" --lines 100)
  LAST=$(echo "$OUTPUT" | tail -r | awk 'BEGIN{found=0} /^(➜|❯|\$ |% |> |.*@.*[\$#%] |.*[\$#➜❯%>] )/{found++; if(found==1){next} if(found==2){print; exit}} {if(found>=1) print}' | tail -r)
  if [ -n "$LAST" ]; then
    echo "$LAST"
  else
    # Fallback to full output if extraction failed
    echo "$OUTPUT"
  fi
else
  cmux read-screen --surface "$SURFACE" --lines 100
fi
