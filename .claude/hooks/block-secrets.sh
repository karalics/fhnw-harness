#!/bin/bash
# PostToolUse hook — block secret leaks in file writes
INPUT=$(cat </dev/stdin)
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // .tool_input.command // ""')

# Check for AWS keys or OpenAI-style API keys
if echo "$CONTENT" | grep -qiE '(AKIA[0-9A-Z]{16}|sk-[a-zA-Z0-9]{40,})'; then
  echo '{"decision":"block","reason":"Secret pattern detected in output"}'
  exit 2
fi

echo '{"decision":"allow"}'
exit 0