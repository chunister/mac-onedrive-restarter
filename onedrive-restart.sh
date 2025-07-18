#!/bin/bash

LOGFILE="${HOME}/opt/onedrive-restart/onedrive_restart.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOGFILE"
}

stopOneDrive() {
log "⏳ Aguardando 5 minutos para sincronizar"
sleep $((5*60))
if pgrep -x "OneDrive" >/dev/null; then
    # 
    NUMBER_OF_ACCOUNTS=2
    log "🔄 Encerrando todas as instâncias do OneDrive"
    for i in $(seq 1 "$NUMBER_OF_ACCOUNTS"); do
        log "🛑 Encerrando OneDrive-$i"
        osascript -e "quit app \"OneDrive\""
    done
    log "✅ Todas as instâncias foram processadas"
else
    log "ℹ️  OneDrive já havia sido encerrado antes do tempo."
fi
log "🎯 Ciclo concluído"
exit 0
}

startOneDrive(){
log "✅ Iniciando OneDrive"
open -a "OneDrive"
}

if pgrep -x "OneDrive" >/dev/null; then
    log "⚠️  OneDrive já está rodando."
    stopOneDrive
fi

startOneDrive
stopOneDrive
