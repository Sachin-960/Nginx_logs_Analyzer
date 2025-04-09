#!/bin/bash

LOG_FILE=$1

# Check if the log file exists
if [[ ! -f "$LOG_FILE" ]]; then
    echo "❌ Log file not found: $LOG_FILE"
    exit 1
fi

echo "=============================="
echo "🔍 Top 5 IPs with most requests"
echo "=============================="
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " request" ( $1>1 ? "s" : "" )}'

echo ""
echo "=============================="
echo "📂 Top 5 Most Requested Paths"
echo "=============================="
awk -F\" '{print $2}' "$LOG_FILE" | awk '{print $2}' | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " request" ( $1>1 ? "s" : "" )}'

echo ""
echo "=============================="
echo "📊 Top 5 Response Status Codes"
echo "=============================="
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " request" ( $1>1 ? "s" : "" )}'

echo ""
echo "=============================="
echo "🧭 Top 5 User Agents"
echo "=============================="
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " request" ( $1>1 ? "s" : "" )}'
