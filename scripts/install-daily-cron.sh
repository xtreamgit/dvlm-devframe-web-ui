#!/bin/bash

# Install Daily Summary Cron Job
# Sets up automatic execution of daily summary at 8:00 AM every day

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SUMMARY_SCRIPT="${SCRIPT_DIR}/generate-daily-summary.sh"

# Make summary script executable
chmod +x "$SUMMARY_SCRIPT"

echo "Installing daily summary automation..."

# Check if running on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS - using launchd"
    
    # Create LaunchAgent plist
    PLIST_FILE="$HOME/Library/LaunchAgents/com.dadf.dailysummary.plist"
    
    cat > "$PLIST_FILE" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.dadf.dailysummary</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>${SUMMARY_SCRIPT}</string>
    </array>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>8</integer>
        <key>Minute</key>
        <integer>0</integer>
    </dict>
    <key>StandardOutPath</key>
    <string>${SCRIPT_DIR}/daily-summary/cron.log</string>
    <key>StandardErrorPath</key>
    <string>${SCRIPT_DIR}/daily-summary/cron.error.log</string>
</dict>
</plist>
EOF
    
    # Load the LaunchAgent
    launchctl unload "$PLIST_FILE" 2>/dev/null || true
    launchctl load "$PLIST_FILE"
    
    echo "✅ Daily summary scheduled for 8:00 AM every day via launchd"
    echo "   Plist file: $PLIST_FILE"
    echo ""
    echo "To manually run the summary:"
    echo "  $SUMMARY_SCRIPT"
    echo ""
    echo "To check the schedule:"
    echo "  launchctl list | grep dailysummary"
    echo ""
    echo "To uninstall:"
    echo "  launchctl unload $PLIST_FILE"
    echo "  rm $PLIST_FILE"
    
else
    echo "Detected Linux/Unix - using cron"
    
    # Create cron job
    CRON_LINE="0 8 * * * $SUMMARY_SCRIPT >> ${SCRIPT_DIR}/daily-summary/cron.log 2>&1"
    
    # Check if cron job already exists
    if crontab -l 2>/dev/null | grep -q "generate-daily-summary.sh"; then
        echo "Cron job already exists. Updating..."
        (crontab -l 2>/dev/null | grep -v "generate-daily-summary.sh"; echo "$CRON_LINE") | crontab -
    else
        echo "Adding new cron job..."
        (crontab -l 2>/dev/null; echo "$CRON_LINE") | crontab -
    fi
    
    echo "✅ Daily summary scheduled for 8:00 AM every day via cron"
    echo ""
    echo "To manually run the summary:"
    echo "  $SUMMARY_SCRIPT"
    echo ""
    echo "To check the cron job:"
    echo "  crontab -l"
    echo ""
    echo "To remove the cron job:"
    echo "  crontab -e  # and delete the line"
fi

echo ""
echo "Running initial summary generation..."
bash "$SUMMARY_SCRIPT"
