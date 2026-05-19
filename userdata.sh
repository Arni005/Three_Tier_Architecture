#!/bin/bash
apt update -y
apt install -y apache2
systemctl start apache2
systemctl enable apache2
echo "<h1>Web Tier Running Successfully</h1>" > /var/www/html/index.html
echo "<h2>Deployed using Terraform</h2>" >> /var/www/html/index.html