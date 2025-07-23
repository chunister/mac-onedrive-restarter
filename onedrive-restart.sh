#!/bin/bash

LOGFILE="${HOME}/opt/mac-onedrive-restarter/onedrive_restart.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOGFILE"
}

cleanup_log(){
    if [ -f "${LOGFILE}" ]; then
        tail -n 168 "${LOGFILE}" > "${LOGFILE}.tmp" && mv "${LOGFILE}.tmp" "$LOGFILE"
    fi
}

stopOneDrive() {
TIME="5"
log "⏳ Waiting ${TIME} minutes for synchronization"
sleep $((${TIME}*60))
if pgrep -x "OneDrive" >/dev/null; then
    # Edit the variable below if you have more than 2 OneDrive accounts running.
    NUMBER_OF_ACCOUNTS=2
    log "🔄 Stopping all OneDrive instances"
    while pgrep -i "OneDrive" > /dev/null; do
        osascript -e "quit app \"OneDrive\""
	sleep 3 
    done
    log "✅ All instances have been processed"
else
    log "ℹ️  OneDrive was already stopped before the timeout."
fi
log "🎯 Cycle completed"
cleanup_log
exit 0
}

startOneDrive(){
log "✅ Starting OneDrive"
open -a "OneDrive"
}

if pgrep -x "OneDrive" >/dev/null; then
    log "⚠️  OneDrive is already running."
    stopOneDrive
fi

startOneDrive
stopOneDrive
