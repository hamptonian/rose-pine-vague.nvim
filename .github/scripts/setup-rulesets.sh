#!/usr/bin/env bash
# Setup GitHub repository rulesets for rose-pine-vague.nvim
# Requires: gh CLI (https://cli.github.com/)
#
# Usage:
#   1. Create the repository on GitHub first:
#      gh repo create hamptonian/rose-pine-vague.nvim --public --description "Rose Pine Vague - A darker, high-contrast Neovim colorscheme"
#
#   2. Run this script from the repository root:
#      .github/scripts/setup-rulesets.sh
#
#   3. Then push your code:
#      git push -u origin main

set -euo pipefail

REPO="hamptonian/rose-pine-vague.nvim"

echo "Setting up rulesets for ${REPO}..."

# Check if gh is installed
if ! command -v gh &> /dev/null; then
    echo "Error: gh CLI is not installed. Install it from https://cli.github.com/"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "Error: Not authenticated with gh. Run 'gh auth login' first."
    exit 1
fi

echo ""
echo "Creating ruleset: Main branch protection"
echo "-----------------------------------------"
echo "Rules:"
echo "  - Prevent force pushes to main/master"
echo "  - Require pull requests for changes"
echo "  - Prevent branch deletion"
echo ""

gh api \
  -X POST \
  "/repos/${REPO}/rulesets" \
  -f name="Main branch protection" \
  -f target="branch" \
  -f enforcement="active" \
  -f conditions='{"ref_name":{"include":["refs/heads/main","refs/heads/master"],"exclude":[]}}' \
  -f rules='[
    {"type":"deletion","parameters":{"allow_deletions_enforcement_level":false}},
    {"type":"non_fast_forward","parameters":{}},
    {"type":"pull_request","parameters":{"required_approving_review_count":0,"dismiss_stale_reviews_on_push":false,"require_code_owner_review":false,"require_last_push_approval":false,"required_review_thread_resolution":false}}
  ]'

echo ""
echo "Ruleset created successfully!"
echo ""
echo "View it at: https://github.com/${REPO}/settings/rules"
