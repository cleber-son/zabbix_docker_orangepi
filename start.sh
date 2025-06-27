#!/bin/bash
#
# start.sh - Manage Zabbix Docker environment on Orange Pi
#
# Author: Cleberson Souza
# Email: cleberson.brasil@gmail.com
# Created: 2025-06-27
# Version: 1.1.0
#
# Description:
#   - Allows starting, stopping, and restarting Zabbix containers
#   - Prepares necessary directories and permissions
#
# License: MIT
#

# -------------------------------

DATA_DIR="./data"

prepare_directories() {
  echo "Creating necessary directories if they don't exist..."

  mkdir -p ${DATA_DIR}/mysql-server
  mkdir -p ${DATA_DIR}/zabbix-server/alertscripts
  mkdir -p ${DATA_DIR}/zabbix-server/externalscripts
  mkdir -p ${DATA_DIR}/zabbix-server/ssh_keys
  mkdir -p ${DATA_DIR}/zabbix-server/zabbix-web
}

set_permissions() {
  echo "Setting execute permissions for alert and external scripts..."

  chmod +x ${DATA_DIR}/zabbix-server/alertscripts/*.sh 2>/dev/null
  chmod +x ${DATA_DIR}/zabbix-server/externalscripts/*.sh 2>/dev/null
}

start_environment() {
  echo "Starting Zabbix Docker environment..."
  docker-compose up -d --build
  echo "Zabbix is now running. Access the web UI at http://localhost:8080"
}

stop_environment() {
  echo "Stopping and removing all Zabbix containers..."
  docker-compose down
  echo "Containers stopped."
}

restart_environment() {
  stop_environment
  start_environment
}

# Main logic
case "$1" in
  start)
    prepare_directories
    set_permissions
    start_environment
    ;;
  stop)
    stop_environment
    ;;
  restart)
    prepare_directories
    set_permissions
    restart_environment
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
    ;;
esac
