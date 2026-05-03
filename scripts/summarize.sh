#!/bin/bash
# Example script to summarize a markdown note using Claude API
# This demonstrates how you could automate AI processing within your Obsidian vault.

# Configure these variables
API_KEY="YOUR_CLAUDE_API_KEY_HERE"  # Replace with your actual API key
MODEL="claude-3-5-sonnet:latest"
API_URL="https://api.anthropic.com/v1/messages"

# Check input
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path-to-markdown-file>"
    exit 1
fi

FILE="$1"
if [ ! -f "$FILE" ]; then
    echo "Error: File not found: $FILE"
    exit 1
fi

# Read the file content
CONTENT=$(cat "$FILE")

# Prepare the prompt - you can customize this
PROMPT="Please provide a concise summary of the following note, highlighting key points, action items, and any important insights:\n\n---\n$CONTENT\n---"

# Call Claude API
RESPONSE=$(curl -s "$API_URL" \
    -H "Content-Type: application/json" \
    -H "x-api-key: $API_KEY" \
    -H "anthropic-version: 2023-06-01" \
    -d "{
        \"model\": \"$MODEL\",
        \"max_tokens\": 1000,
        \"messages\": [
            {
                \"role\": \"user\",
                \"content\": \"$PROMPT\"
            }
        ]
    }")

# Extract and display the summary (simplified parsing)
echo "=== AI Summary for $FILE ==="
echo "$RESPONSE" | grep -o '"text":"[^"]*"' | cut -d'"' -f4 | sed 's/\\n/\n/g'
echo "============================"

# Note: In a real integration, you would save this summary back to Obsidian,
# perhaps as a comment or a new section in the note, or create a linked summary note.