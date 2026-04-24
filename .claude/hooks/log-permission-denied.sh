#!/bin/bash
# Notification hook — log permission-denied events
INPUT=$(cat </dev/stdin)
MESSAGE=$(echo "$INPUT" | jq -r '.message // ""')

if echo "$MESSAGE" | grep -qi "permission denied\|denied by user\|not allowed\|was rejected"; then
  LOGFILE=".claude/permission-denied.log"
  TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
  TOOL=$(echo "$INPUT" | jq -r '.tool_name // "unknown"')
  echo "[$TIMESTAMP] tool=$TOOL message=$MESSAGE" >> "$LOGFILE"
fi
