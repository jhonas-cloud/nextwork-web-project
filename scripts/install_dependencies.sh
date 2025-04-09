#!/bin/bash
sudo yum install tomcat -y
sudo  yum install httpd -y
sudo cat << EOF > /etc/httpd/conf.d/tomcat_manager.conf
<VirtualHost *:80>
    ServerAdmin root@localhost
    ServerName app.nextwork.com
    DefaultType text/html
    ProxyRequests off
    ProxyPreserveHost On
    ProxyPass / http://localhost:8080/nextwork-web-project/
    ProxyPassReserve / http://localhost:8080/nextwork-web-project/
</VirtualHost>
EOF

