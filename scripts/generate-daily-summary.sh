#!/bin/bash

# Daily Summary Generator for DADF Repositories
# Generates a summary of daily activities across all DADF repositories

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Go up two levels: scripts -> dvlm-devframe-web-ui -> xtreamgit
ROOT_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"
SUMMARIES_DIR="${SCRIPT_DIR}/daily-summary"
DATE=$(date +%Y-%m-%d)
SUMMARY_FILE="${SUMMARIES_DIR}/daily-summary-${DATE}.md"

# Repository list
REPOS=(
    "dvlm-devframe-web-ui"
    "dvlm-devframe-api"
    "dvlm-devframe-prompts"
    "dvlm-devframe-agents"
    "dvlm-devframe-infra"
    "dvlm-devframe-standards"
)

# Create summaries directory if it doesn't exist
mkdir -p "$SUMMARIES_DIR"

# Function to get git log for today
get_today_commits() {
    local repo=$1
    local repo_path="${ROOT_DIR}/${repo}"
    
    if [ ! -d "$repo_path/.git" ]; then
        return
    fi
    
    cd "$repo_path"
    
    # Get commits from today
    git log --since="midnight" --pretty=format:"- %s (%h) - %an" 2>/dev/null || true
}

# Function to get file changes for today
get_today_changes() {
    local repo=$1
    local repo_path="${ROOT_DIR}/${repo}"
    
    if [ ! -d "$repo_path/.git" ]; then
        return
    fi
    
    cd "$repo_path"
    
    # Get stats for today's commits
    git log --since="midnight" --stat --oneline 2>/dev/null | grep -E '^\s+\d+\s+files?\s+changed' | head -1 || echo "No changes"
}

# Function to get branch status
get_branch_status() {
    local repo=$1
    local repo_path="${ROOT_DIR}/${repo}"
    
    if [ ! -d "$repo_path/.git" ]; then
        echo "Not initialized"
        return
    fi
    
    cd "$repo_path"
    
    local branch=$(git branch --show-current 2>/dev/null || echo "N/A")
    local status=$(git status --short 2>/dev/null | wc -l | tr -d ' ')
    
    echo "Branch: ${branch}, Uncommitted changes: ${status}"
}

# Function to count files by type
count_files() {
    local repo=$1
    local repo_path="${ROOT_DIR}/${repo}"
    
    if [ ! -d "$repo_path" ]; then
        return
    fi
    
    cd "$repo_path"
    
    local total=$(find . -type f ! -path '*/\.*' ! -path '*/node_modules/*' ! -path '*/__pycache__/*' 2>/dev/null | wc -l | tr -d ' ')
    echo "${total} files"
}

# Generate summary header
cat > "$SUMMARY_FILE" << EOF
# Daily Summary - ${DATE}

**Generated**: $(date '+%Y-%m-%d %H:%M:%S %Z')

## Overview

This summary covers activities across all DADF Phase-1 repositories for ${DATE}.

---

EOF

# Repository-specific summaries
for repo in "${REPOS[@]}"; do
    echo "## Repository: ${repo}" >> "$SUMMARY_FILE"
    echo "" >> "$SUMMARY_FILE"
    
    repo_path="${ROOT_DIR}/${repo}"
    
    if [ ! -d "$repo_path" ]; then
        echo "**Status**: ⚠️ Repository not found" >> "$SUMMARY_FILE"
        echo "" >> "$SUMMARY_FILE"
        continue
    fi
    
    # Branch and status
    echo "**Status**: $(get_branch_status "$repo")" >> "$SUMMARY_FILE"
    echo "" >> "$SUMMARY_FILE"
    
    # File count
    echo "**Files**: $(count_files "$repo")" >> "$SUMMARY_FILE"
    echo "" >> "$SUMMARY_FILE"
    
    # Today's commits
    echo "### Commits Today" >> "$SUMMARY_FILE"
    echo "" >> "$SUMMARY_FILE"
    
    commits=$(get_today_commits "$repo")
    if [ -z "$commits" ]; then
        echo "No commits today" >> "$SUMMARY_FILE"
    else
        echo "$commits" >> "$SUMMARY_FILE"
    fi
    echo "" >> "$SUMMARY_FILE"
    
    # File changes
    echo "### Changes" >> "$SUMMARY_FILE"
    echo "" >> "$SUMMARY_FILE"
    changes=$(get_today_changes "$repo")
    echo "$changes" >> "$SUMMARY_FILE"
    echo "" >> "$SUMMARY_FILE"
    
    echo "---" >> "$SUMMARY_FILE"
    echo "" >> "$SUMMARY_FILE"
done

# Activity Summary
cat >> "$SUMMARY_FILE" << EOF

## Activity Summary

### Commits
EOF

total_commits=0
for repo in "${REPOS[@]}"; do
    repo_path="${ROOT_DIR}/${repo}"
    if [ -d "$repo_path/.git" ]; then
        cd "$repo_path"
        count=$(git log --since="midnight" --oneline 2>/dev/null | wc -l | tr -d ' ')
        total_commits=$((total_commits + count))
    fi
done

echo "- **Total commits across all repos**: ${total_commits}" >> "$SUMMARY_FILE"
echo "" >> "$SUMMARY_FILE"

# Tasks section
cat >> "$SUMMARY_FILE" << EOF
### Tasks Created
- Review daily-summary automation
- Monitor repository health

### Fixes Applied
- None recorded for today

### Corrections
- None recorded for today

### Notes
- All Phase-1 repositories initialized and bootstrapped
- Daily summary automation configured
- Ready for active development

---

## Next Steps

1. **Code Review**: Review any pending pull requests
2. **Testing**: Ensure all tests pass across repositories
3. **Documentation**: Update documentation for any new features
4. **Dependencies**: Check for dependency updates

## Health Check

EOF

# Health check
for repo in "${REPOS[@]}"; do
    repo_path="${ROOT_DIR}/${repo}"
    if [ -d "$repo_path" ]; then
        echo "✅ ${repo}" >> "$SUMMARY_FILE"
    else
        echo "❌ ${repo}" >> "$SUMMARY_FILE"
    fi
done

echo "" >> "$SUMMARY_FILE"
echo "---" >> "$SUMMARY_FILE"
echo "" >> "$SUMMARY_FILE"
echo "*Summary generated by DADF automation system*" >> "$SUMMARY_FILE"

echo "Daily summary generated: ${SUMMARY_FILE}"
