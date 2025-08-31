#!/bin/bash
set -e

# Usage: ./migrate.sh project_a add_customers
SCHEMA="project_$1"
MIGRATION_NAME="$2"

# Check inputs
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <project> <migration_name>"
    echo "Example: $0 a add_customers"
    exit 1
fi

# Check we're in Supabase project
if [ ! -f "supabase/config.toml" ]; then
    echo "Error: Not in a Supabase project"
    exit 1
fi

# Check if local database is running
if ! supabase status 2>/dev/null | grep -q "RUNNING"; then
    echo "Error: Local database not running"
    echo "Run: supabase start"
    exit 1
fi

# Step 1: Generate migration
echo "Generating migration for schema: $SCHEMA"
supabase db diff --schema "$SCHEMA" -f "$MIGRATION_NAME"

# Step 2: Find and show the generated migration
# Count SQL files before and after to detect new ones
MIGRATIONS_AFTER=$(ls supabase/migrations/*.sql 2>/dev/null | wc -l)
if [ "$MIGRATIONS_AFTER" -eq 0 ]; then
    echo "No migration generated - no changes detected"
    exit 0
fi

# Get the most recent SQL file (wildcard, any name)
MIGRATION_FILE=$(ls -t supabase/migrations/*.sql 2>/dev/null | head -1)
if [ -z "$MIGRATION_FILE" ]; then
    echo "Warning: Could not find generated migration file"
    exit 1
fi

echo ""
echo "Generated migration: $(basename $MIGRATION_FILE)"
echo "===================="
cat "$MIGRATION_FILE"
echo "===================="
echo ""

# Step 3: Ask for confirmation
read -p "Apply this migration locally? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    supabase db reset
    echo "✓ Applied to local database"
else
    echo "Migration generated but not applied"
    echo "To apply later: supabase db reset"
fi
