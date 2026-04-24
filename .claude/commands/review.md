# /review — Code review current changes

Review the current diff for quality issues:

1. Run `git diff` to see all staged and unstaged changes
2. Check every changed file for:
   - Security issues (hardcoded secrets, injection vectors)
   - Missing tests for new logic
   - Style violations per CLAUDE.md conventions
3. Rate the changes: Ship / Needs Work / Block
4. List specific findings with file:line references
