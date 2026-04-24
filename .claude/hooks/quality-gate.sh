#!/bin/bash
# PreToolUse hook — require tests pass before any commit
INPUT=$(cat </dev/stdin)
TOOL=$(echo "$INPUT" | jq -r '.tool_name')

if [ "$TOOL" = "Bash" ]; then
  CMD=$(echo "$INPUT" | jq -r '.tool_input.command')
  if echo "$CMD" | grep -q "git commit"; then
    # Run tests and check for pass
    if ! npm test 2>&1 | tail -1 | grep -q "passed"; then
      echo '{"decision":"block","reason":"Tests must pass before commit"}'
      exit 2
    fi
  fi
fi

echo '{"decision":"allow"}'
exit 0