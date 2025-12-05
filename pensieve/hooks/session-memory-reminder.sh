#!/bin/bash
# SessionStart hook - MANDATORY memory retrieval protocol + version check
# This hook fires when a new session begins or resumes

# Check for pensieve CLI updates via Homebrew (non-blocking)
UPDATE_MESSAGE=""
if command -v brew &>/dev/null && command -v pensieve &>/dev/null; then
  OUTDATED=$(brew outdated pensieve 2>/dev/null)
  if [ -n "$OUTDATED" ]; then
    # Get current and latest versions
    CURRENT=$(pensieve --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
    LATEST=$(brew info pensieve 2>/dev/null | head -1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
    UPDATE_MESSAGE="

⬆️ **Pensieve CLI Update Available**
Current: ${CURRENT:-unknown} → Latest: ${LATEST:-newer}

After completing the mandatory protocol, ask the user: \"Would you like me to update Pensieve CLI now? (brew upgrade pensieve)\""
  fi
fi

# Build the additionalContext - use jq for proper JSON escaping
read -r -d '' CONTEXT << 'HEREDOC'
<EXTREMELY_IMPORTANT>
🔴 MANDATORY SESSION START PROTOCOL [Pensieve v1.0.0]

BEFORE responding to ANY user request in this project, you MUST complete this checklist:

1. ☐ Invoke memory-management skill using Skill tool
2. ☐ Run: pensieve journal
3. ☐ Review the journal output with the user
4. ☐ Acknowledge findings or explicitly state "No recent activity"

This is NOT optional. This is NOT a suggestion. You MUST complete this protocol.

Why: The journal shows recent project activity and learnings you need to know.
Skipping this protocol = missing context and re-discovering known solutions.

Evidence before claims - always show the journal output to the user.

**If you catch yourself thinking:**
- "This is just a quick question" → WRONG. Check the journal first.
- "I'll check after I gather context" → WRONG. The journal IS context.
- "Let me investigate first" → WRONG. The journal tells you where to look.
- "This doesn't need a journal check" → WRONG. You don't know until you check.

**THE PROTOCOL IS MANDATORY. COMPLETE IT NOW.**
</EXTREMELY_IMPORTANT>
HEREDOC

# Append update message if available
if [ -n "$UPDATE_MESSAGE" ]; then
  # Insert update message before closing tag
  CONTEXT="${CONTEXT//<\/EXTREMELY_IMPORTANT>/${UPDATE_MESSAGE}
<\/EXTREMELY_IMPORTANT>}"
fi

# Use jq for proper JSON escaping if available, otherwise fall back to manual escaping
if command -v jq &>/dev/null; then
  ESCAPED_CONTEXT=$(printf '%s' "$CONTEXT" | jq -Rs '.')
  cat << EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": ${ESCAPED_CONTEXT}
  }
}
EOF
else
  # Fallback: manual escaping for systems without jq
  ESCAPED_CONTEXT=$(printf '%s' "$CONTEXT" | awk '{gsub(/\\/,"\\\\"); gsub(/"/,"\\\""); gsub(/\t/,"\\t"); printf "%s\\n", $0}' | tr -d '\n' | sed 's/\\n$//')
  cat << EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "${ESCAPED_CONTEXT}"
  }
}
EOF
fi
exit 0
