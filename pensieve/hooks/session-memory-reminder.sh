#!/bin/bash
# SessionStart hook - MANDATORY memory retrieval protocol
# This hook fires when a new session begins or resumes

cat << 'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "<EXTREMELY_IMPORTANT>\n🔴 MANDATORY SESSION START PROTOCOL [Pensieve v1.0.0]\n\nBEFORE responding to ANY user request in this project, you MUST complete this checklist:\n\n1. ☐ Invoke memory-management skill using Skill tool\n2. ☐ Run: pensieve entry search\n3. ☐ Show the search output to the user (even if empty)\n4. ☐ Acknowledge findings or explicitly state \"No memories found\"\n\nThis is NOT optional. This is NOT a suggestion. You MUST complete this protocol.\n\nWhy: Past learnings contain solutions to problems you're about to face.\nSkipping this protocol = wasting time re-discovering known solutions.\n\nEvidence before claims - always show the actual search output to the user.\n\n**If you catch yourself thinking:**\n- \"This is just a quick question\" → WRONG. Search first.\n- \"I'll search after I gather context\" → WRONG. Search IS gathering context.\n- \"Let me investigate first\" → WRONG. Memories tell you where to investigate.\n- \"This doesn't need memory search\" → WRONG. You don't know until you search.\n\n**THE PROTOCOL IS MANDATORY. COMPLETE IT NOW.**\n</EXTREMELY_IMPORTANT>"
  }
}
EOF
exit 0
