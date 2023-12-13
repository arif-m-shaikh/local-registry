#!/bin/bash
set -x

echo "docker installation ===================>remove docker compose"
sudo rm -rf /usr/local/bin/docker-compose
sudo rm -rf /usr/bin/docker-compose

echo "docker installation ===================>uninstalling docker tools"
sudo apt-get -y purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
sudo apt-get -y autoremove docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
sudo rm -rf /var/lib/docker /etc/docker 
sudo groupdel docker 
sudo rm -rf /var/run/docker.sock 