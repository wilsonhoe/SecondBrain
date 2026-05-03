#!/bin/bash
# Improved daily heartbeat for AI Second Brain
# Enhanced people/CRM detection and relationship management focus

VAULT="/home/wls/second-brain/vault"
INBOX="$VAULT/00_Inbox"
DAILY="$VAULT/01_Daily"
PROJECTS="$VAULT/02_Projects"
PEOPLE="$VAULT/04_People"
AI="$VAULT/AI"
MEMORY="$AI/memory.md"
LOG="$AI/heartbeat.log"

# Ensure directories exist
mkdir -p "$INBOX" "$DAILY" "$PROJECTS" "$PEOPLE" "$AI"

echo "=== AI Second Brain Heartbeat: $(date) ===" >> "$LOG"

# Process each file in inbox
for file in "$INBOX"/*; do
    [ -e "$file" ] || continue
    filename=$(basename "$file")
    echo "Processing $filename" >> "$LOG"

    # Initialize scoring system for more nuanced routing
    project_score=0
    people_score=0

    # Check for explicit project indicators (strong signals)
    if grep -iqE "\b(project|milestone|deadline|sprint|deliverable|timeline|roadmap)\b" "$file"; then
        project_score=$((project_score + 2))
    fi

    # Check for explicit people/CRM indicators (strong signals for relationship management)
    if grep -iqE "\b(client|customer|partner|vendor|stakeholder|contact person|account)\b" "$file"; then
        people_score=$((people_score + 3))
    fi

    # Check for communication/interaction indicators
    if grep -iqE "\b(call|call with|called|calling|meet|meeting with|met with|video call|zoom call|teams call|discuss|discussed|speak|spoke|talk|talked|email|emailed|message|messaged)\b" "$file"; then
        people_score=$((people_score + 2))
    fi

    # Check for relationship/context words
    if grep -iqE "\b(introduce|introduced|referral|reference|follow up|follow-up|next steps|action item)\b" "$file"; then
        people_score=$((people_score + 1))
    fi

    # Determine destination based on scores
    dest=""
    if [ $people_score -ge 3 ] && [ $people_score -gt $project_score ]; then
        dest="$PEOPLE"
    elif [ $project_score -ge 3 ] && [ $project_score -gt $people_score ]; then
        dest="$PROJECTS"
    elif [ $people_score -gt 0 ] && [ $project_score -gt 0 ]; then
        # Both signals present - check content for primary focus
        # If it mentions specific people names or direct communication, lean toward PEOPLE
        if grep -iqE "\b(call with|met with|spoke with|talked with|emailed|messaged)\b" "$file"; then
            dest="$PEOPLE"
        else
            dest="$PROJECTS"
        fi
    elif [ $people_score -gt 0 ]; then
        dest="$PEOPLE"
    elif [ $project_score -gt 0 ]; then
        dest="$PROJECTS"
    else
        # Default to daily notes with timestamp
        dest="$DAILY"
    fi

    # Move file to destination with a clean name (keep original name)
    mv "$file" "$dest/$filename"
    echo "  Moved to $dest (P:$project_score, C:$people_score)" >> "$LOG"

    # Extract insights and append to memory
    # Enhanced extraction: first line as summary, plus any lines with TODO, plus people/org names
    summary=$(head -n 1 "$dest/$filename")
    todos=$(grep -n "^- \[ \]" "$dest/$filename" | head -5)
    people_orgs=$(grep -ioE "\b[A-Z][a-z]+ [A-Z][a-z]+\b|\b[A-Z][a-z]+&[A-Z][a-z]+\b|\b[A-Z][A-Z]+\b" "$dest/$filename" | sort -u | head -5)
    {
        echo "## Insight from $filename ($(date +%Y-%m-%d))"
        echo "Summary: $summary"
        if [ -n "$todos" ]; then
            echo "Todos found:"
            echo "$todos"
        fi
        if [ -n "$people_orgs" ]; then
            echo "People/Orgs detected:"
            echo "$people_orgs"
        fi
        echo ""
    } >> "$MEMORY"
done

# Optional: Run a quick knowledge graph update (just a note)
echo "Heartbeat completed. Memory updated." >> "$LOG"