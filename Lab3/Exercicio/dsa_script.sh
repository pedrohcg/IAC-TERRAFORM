#!/bin/bash
SERVER_ID = $1

sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo bash -c 'echo Bem-vindo ao Server {$SERVER_ID} > /var/www/html/index.html'