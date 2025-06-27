#!/bin/bash
#
# start.sh - Initialize Zabbix Docker environment
#
# Author: Cleberson Souza
# Email: cleberson.brasil@gmail.com
# Created: 2025-06-27
# Version: 1.0.0
#
# Description:
#   - Creates required folders and sets permissions
#   - Brings down any existing containers
#   - Builds and starts containers with docker-compose
#
# License: MIT
#
# -------------------------------

echo "Checking required data directories..."

mkdir -p ./data/mysql-server
mkdir -p ./data/zabbix-server/alertscripts
mkdir -p ./data/zabbix-server/externalscripts
mkdir -p ./data/zabbix-server/ssh_keys
mkdir -p ./data/zabbix-server/zabbix-web

echo "Setting execution permission for scripts..."

chmod +x ./data/zabbix-server/alertscripts/*.sh 2>/dev/null
chmod +x ./data/zabbix-server/externalscripts/*.sh 2>/dev/null

echo "Starting Zabbix Docker environment..."

docker-compose down
docker-compose up -d --build

echo "Zabbix environment started successfully!"
echo "Access the web interface at: http://localhost:8080"
