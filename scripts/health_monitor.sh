#!/usr/bin/env bash
VAULT="/home/wls/second-brain/vault"
HEARTBEAT_LOG="$VAULT/AI/heartbeat.log"
MEMORY_FILE="$VAULT/AI/memory.md"
HEARTBEAT_SCRIPT="/home/wls/second-brain/scripts/daily_heartbeat.sh"
LOG_FILE="$VAULT/AI/health_monitor.log"

# Telegram Bot Configuration (same as Lisa's LisaTrader_bot)
TELEGRAM_BOT_TOKEN="8606848979:AAHIwphVuvYIhYgJ-6XvlJcdYnS8Dk7464E"
TELEGRAM_CHAT_ID="507276036"  # This is the chat ID for @LisaTrader_bot

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

check_heartbeat_recent() {
    if [ ! -f "$HEARTBEAT_LOG" ]; then
        log "Heartbeat log not found"
        return 1
    fi
    # Check if heartbeat ran in last 25 hours
    if ! grep -q "Heartbeat completed" "$HEARTBEAT_LOG" 2>/dev/null || \
       ! [ "$(find "$HEARTBEAT_LOG" -mmin -1500 -print -quit 2>/dev/null)" ]; then
        log "Heartbeat not recent"
        return 1
    fi
    log "Heartbeat is recent"
    return 0
}

check_memory_updated() {
    if [ ! -f "$MEMORY_FILE" ]; then
        log "Memory file not found"
        return 1
    fi
    # Check if memory updated in last 25 hours
    if ! [ "$(find "$MEMORY_FILE" -mmin -1500 -print -quit 2>/dev/null)" ]; then
        log "Memory not updated recently"
        return 1
    fi
    log "Memory is recent"
    return 0
}

check_vault_structure() {
    for dir in "00_Inbox" "01_Daily" "02_Projects" "04_People" "AI"; do
        if [ ! -d "$VAULT/$dir" ]; then
            log "Missing vault directory: $dir"
            return 1
        fi
    done
    log "Vault structure is intact"
    return 0
}

get_heartbeat_status() {
    if [ ! -f "$HEARTBEAT_LOG" ]; then
        echo "No heartbeat log found"
        return
    fi

    # Get last heartbeat time
    last_heartbeat=$(tail -10 "$HEARTBEAT_LOG" | grep "Heartbeat completed" | tail -1 | sed 's/.*Heartbeat: //' | sed 's/ ====.*//')
    if [ -z "$last_heartbeat" ]; then
        last_heartbeat="Unknown"
    fi

    echo "$last_heartbeat"
}

get_memory_status() {
    if [ ! -f "$MEMORY_FILE" ]; then
        echo "No memory file"
        return
    fi

    # Count insights in memory
    insight_count=$(grep -c "## Insight from" "$MEMORY_FILE" 2>/dev/null || echo "0")
    echo "Insights: $insight_count"
}

send_telegram_message() {
    local message="$1"
    log "Attempting to send Telegram message (length: ${#message})"

    # Send message via Telegram Bot API
    response=$(curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
         -d chat_id="$TELEGRAM_CHAT_ID" \
         -d text="$message" \
         -d parse_mode="HTML")

    # Check if message was sent successfully
    if echo "$response" | grep -q '"ok":true'; then
        log "Telegram message sent successfully"
        return 0
    else
        log "Failed to send Telegram message: $response"
        return 1
    fi
}

main() {
    log "=== Second Brain Health Monitor Started ==="
    local issues=()
    local status_info=""

    if ! check_heartbeat_recent; then
        issues+=("Heartbeat not run in last 25 hours")
    else
        last_hb=$(get_heartbeat_status)
        status_info+="<b>Last Heartbeat:</b> $last_hb\n"
    fi

    if ! check_memory_updated; then
        issues+=("Memory file not updated in last 25 hours")
    else
        mem_status=$(get_memory_status)
        status_info+="<b>Memory Status:</b> $mem_status\n"
    fi

    if ! check_vault_structure; then
        issues+=("Vault directory structure incomplete")
    fi

    # Add individual directory checks
    for dir in "00_Inbox" "01_Daily" "02_Projects" "04_People" "AI"; do
        if [ ! -d "$VAULT/$dir" ]; then
            issues+=("Missing vault directory: $dir")
        fi
    done

    if [ ${#issues[@]} -eq 0 ]; then
        # Daily status report - send only once per day at 9:05 AM
        if [ "$(date +%H:%M)" = "09:05" ]; then
            log "Sending daily status report (scheduled time)"
            local status_msg="✅ <b>Second Brain Status: HEALTHY</b>\n"
            status_msg+="<b>• All systems operational</b>\n"
            status_msg+="$status_info"
            status_msg+="<b>• Timestamp:</b> $(date)"
            send_telegram_message "$status_msg"
        else
            log "Not sending daily status report (not 09:05)"
        fi
    else
        # Alert when issues detected
        log "Sending alert - issues detected: ${#issues[@]}"
        local alert_msg="🚨 <b>SECOND BRAIN ALERT</b>\n"
        for issue in "${issues[@]}"; do
            alert_msg+="• $issue\n"
        done
        alert_msg+="<b>Time:</b> $(date)"
        send_telegram_message "$alert_msg"
    fi

    log "=== Second Brain Health Monitor Completed ==="
}

main "$@"