#!/bin/bash

echo "Verificando diretórios de dados..."

mkdir -p ./data/mysql-server
mkdir -p ./data/zabbix-server/alertscripts
mkdir -p ./data/zabbix-server/externalscripts
mkdir -p ./data/zabbix-server/ssh_keys
mkdir -p ./data/zabbix-server/zabbix-web

echo "Aplicando permissões básicas aos scripts..."

chmod +x ./data/zabbix-server/alertscripts/*.sh 2>/dev/null
chmod +x ./data/zabbix-server/externalscripts/*.sh 2>/dev/null

echo "Iniciando ambiente Zabbix com Docker..."

docker-compose down
docker-compose up -d --build

echo "Ambiente iniciado com sucesso!"
echo "Acesse a interface web em: http://localhost:8080"
