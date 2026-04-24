#!/bin/bash
# PostToolUse hook — run ESLint on edited .ts files
INPUT=$(cat </dev/stdin)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""')

# Only lint TypeScript files under src/
if [[ "$FILE" != *.ts ]] || [[ "$FILE" != */src/* ]]; then
  echo '{"decision":"allow"}'
  exit 0
fi

LINT_OUTPUT=$(npx eslint "$FILE" 2>&1)
LINT_EXIT=$?

if [ $LINT_EXIT -ne 0 ]; then
  ESCAPED=$(echo "$LINT_OUTPUT" | jq -Rs .)
  echo "{\"decision\":\"block\",\"reason\":$ESCAPED}"
  exit 2
fi

echo '{"decision":"allow"}'
exit 0
