# Velox Infrastructure Scripts

Self-updating infrastructure scripts for AI agents and development workflows.

## Auto-Fetching Pattern

AI agents can automatically download and use these scripts:

```bash
# Enhanced worktree creation with .env copying
if [ ! -f "create_worktree.sh" ]; then
  curl -o create_worktree.sh https://raw.githubusercontent.com/veloxforce/infrastructure-scripts/main/create_worktree.sh
  chmod +x create_worktree.sh
fi

# Usage
. ./create_worktree.sh my-feature-branch
```

## Available Scripts

### `create_worktree.sh`
Enhanced Git worktree creation that automatically:
- Creates isolated worktree with new branch
- Copies .env files automatically
- Prevents environment setup issues
- AI-agent friendly (no prompts)

**Usage:**
```bash
. ./create_worktree.sh feature-name
```

## Adding to Projects

Add this pattern to your project's `CLAUDE.md` or documentation:

```markdown
## Development Setup

AI agents will auto-fetch required tools:

```bash
if [ ! -f "create_worktree.sh" ]; then
  curl -o create_worktree.sh https://raw.githubusercontent.com/veloxforce/infrastructure-scripts/main/create_worktree.sh
  chmod +x create_worktree.sh
fi
```

This enables zero-setup development environments.
```

## Contributing

1. Test scripts locally
2. Ensure they work without prompts (AI-friendly)
3. Update this README
4. Scripts are public - no secrets!