# FHNW Harness Project

## Stack
- Runtime: Node 20 LTS
- Test: Vitest
- Lint: ESLint 9 flat config
- Language: TypeScript strict

## Conventions
- All source lives in src/
- Tests next to source: foo.test.ts
- Named exports only (no default exports)
- Commit style: conventional commits (feat/fix/chore)

## Commands
- Test: npm test
- Lint: npm run lint
- Build: npm run build

## Quality Rules
- Never skip tests
- Every PR needs at least one test
- Read before editing — verify assumptions first
- No console.log in production code
