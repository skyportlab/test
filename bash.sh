#!/bin/bash
# Script para instalar OpenSSH Server y Remote.it

# Actualizar repositorios
echo "Actualizando repositorios..."
sudo apt-get update -y

# Instalar OpenSSH Server si no está instalado
if ! dpkg -l | grep -q openssh-server; then
    echo "Instalando OpenSSH Server..."
    sudo apt-get install -y openssh-server
else
    echo "OpenSSH Server ya está instalado."
fi

# Iniciar el servicio SSH si no está activo
if ! systemctl is-active --quiet ssh; then
    echo "Iniciando el servicio SSH..."
    sudo systemctl enable ssh
    sudo systemctl start ssh
fi

# Instalar Remote.it
echo "Instalando Remote.it..."
R3_REGISTRATION_CODE="886DABAA-DD4C-5F4F-8375-F39F0B8EB639"
sh -c "$(curl -L https://downloads.remote.it/remoteit/install_agent.sh)"

echo "Todo listo ✅"
