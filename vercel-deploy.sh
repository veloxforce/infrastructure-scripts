#!/bin/bash
# Autonomous Vercel preview deployment with prerequisite validation
# Self-healing infrastructure pattern for AI agents and developers
# Production promotion via Vercel UI only

set -e  # Exit on any error

echo "🚀 Vercel Preview Deployment Script (Self-Healing)"

# Gate 1: Verify CLI
echo "🔍 Checking Vercel CLI..."
if ! command -v vercel >/dev/null 2>&1; then
    echo "❌ ERROR: Vercel CLI not found"
    echo "   Install: npm install -g vercel"
    echo "   Or: curl -sS https://vercel.com/install | sh"
    exit 1
fi
echo "✅ Vercel CLI found"

# Gate 2: Verify Project Linking
echo "🔗 Checking project linking..."
if [ ! -f "frontend/.vercel/project.json" ]; then
    echo "❌ ERROR: Project not linked to Vercel"
    echo "   Run: cd frontend/ && vercel link"
    echo "   This creates the connection between local and remote project"
    exit 1
fi

# Extract project name for confirmation
if command -v jq >/dev/null 2>&1; then
    PROJECT_NAME=$(jq -r '.projectName' frontend/.vercel/project.json 2>/dev/null || echo "unknown")
    echo "✅ Linked to project: $PROJECT_NAME"
else
    echo "✅ Project linking verified"
fi

# Gate 3: Deploy Preview Only
echo "🚢 Deploying preview (production promotion via UI only)..."
if vercel --cwd frontend/ deploy; then
    echo ""
    echo "✅ Preview deployment successful!"
    echo "🔗 Preview URL generated - check output above"
    echo "📋 To promote to production:"
    echo "   1. Test the preview URL"
    echo "   2. Go to Vercel dashboard"
    echo "   3. Click 'Promote to Production'"
    echo ""
else
    echo "❌ Preview deployment failed - check output above"
    exit 1
fi