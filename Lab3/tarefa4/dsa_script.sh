#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo bash -c    'echo Criando o Primeiro Web Server com Terraform > /var/www/html/index.html'