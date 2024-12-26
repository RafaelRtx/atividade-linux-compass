#!/bin/bash

# Diretório de saída
OUTPUT_DIR="/home/linux-compass/nginx_status_logs"
ONLINE_FILE="$OUTPUT_DIR/nginx_online.log"
OFFLINE_FILE="$OUTPUT_DIR/nginx_offline.log"

# Data e hora
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Verifica o status do NGINX
if systemctl is-active --quiet nginx; then
    # Serviço ONLINE
    echo "$TIMESTAMP - nginx - ONLINE - O serviço está Online." >> $ONLINE_FILE
else
    # Serviço OFFLINE
    echo "$TIMESTAMP - nginx - OFFLINE - O serviço está Offline" >> $OFFLINE_FILE
fi