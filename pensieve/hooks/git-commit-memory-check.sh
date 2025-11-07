#!/bin/bash
# PostToolUse:Bash hook - Fires after git commits
# Reminds Claude to record significant learnings after committing code

# Read JSON input from stdin
input=$(cat)

# Check if the bash command was a git commit
if echo "$input" | grep -q 'git commit'; then
    cat << 'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "PostToolUse",
    "additionalContext": "<important-reminder>\n💾 Git Commit Detected - Recording Decision Required\n\nYou just made a git commit. Apply the 3-question rubric:\n\n1. Complexity: >30 min, non-obvious solution?\n2. Novelty: Not documented elsewhere?\n3. Reusability: Helps in 3+ months?\n\nScore 3/3: Record to Pensieve immediately\nScore 2/3: Ask user if worth recording\nScore 0-1/3: Skip (too routine)\n\nUse memory-management skill for recording guidance.\n</important-reminder>"
  }
}
EOF
fi

exit 0
