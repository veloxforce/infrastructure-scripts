# Velox Infrastructure Scripts

Self-healing infrastructure patterns for autonomous development environments.

## Philosophy: Infrastructure as URLs

This repository enables the **auto-fetching pattern** - tools that install themselves when needed. 
AI agents and developers can work in any environment without setup friction.

## The Pattern

```bash
# Tools auto-install when missing
VELOX_INFRA="https://raw.githubusercontent.com/veloxforce/infrastructure-scripts/main"
[ ! -f "TOOL_NAME" ] && curl -sO "$VELOX_INFRA/TOOL_NAME" && chmod +x TOOL_NAME
```

This pattern enables:
- ✅ **Zero-setup development** - No manual tool installation
- ✅ **Self-healing environments** - Missing tools auto-restore  
- ✅ **Autonomous AI agents** - Can work without human intervention
- ✅ **Consistent tooling** - Same tools across all projects

## Usage in Projects

Add to your project documentation:

```bash
# Infrastructure tools auto-fetch from Velox standards
VELOX_INFRA="https://raw.githubusercontent.com/veloxforce/infrastructure-scripts/main"

# Example: Auto-fetch worktree creation tool
[ ! -f "create_worktree.sh" ] && curl -sO "$VELOX_INFRA/create_worktree.sh" && chmod +x create_worktree.sh
```

Then fetch any tool as needed. The pattern, not the tool list, is what matters.

## How It Works

1. **AI agent needs a tool** → Checks if it exists locally
2. **Tool missing** → Auto-downloads from this repository
3. **Tool available** → Continues with task
4. **Environment self-heals** → No manual intervention needed

This transforms development from "Did you install X?" to "Tools appear when needed."

## Design Principles

Scripts in this repository must be:

1. **Autonomous** - No user prompts or interaction required
2. **Idempotent** - Safe to run multiple times without side effects
3. **Self-contained** - Minimal external dependencies
4. **AI-friendly** - Clear output, predictable behavior, no ambiguity

## Contributing

Before adding a script, ask:
- Does it follow the autonomous principles above?
- Will it work without human intervention?
- Is it genuinely reusable across different projects?
- Does it solve a common infrastructure need?

Focus on **patterns over implementations** - scripts should embody reusable principles, not project-specific solutions.

---

*This repository enables Infrastructure as Code to evolve into Infrastructure as URLs - where tools live as addressable, self-installing resources that autonomous systems can discover and use.*