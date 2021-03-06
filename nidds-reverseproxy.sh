#!/bin/sh
#
#Nginx and LetsEncrypt
#
apt-get update && apt -y install nginx
read -p 'Enter domain name: ' domain
tail -13 /etc/nginx/sites-enabled/default > $domain
mv $domain /tmp/file.txt
cd /tmp
sed -i 's/#/ /g' file.txt
sed -i '7d;8d' file.txt
sed -i "s/example.com/$domain/g" file.txt
sed -i 's/try_files $uri $uri\/ =404/proxy_pass http:\/\/127.0.0.1:1020/g' file.txt
#read -p 'Enter server port number: ' port
#sed -i 's/try_files $uri $uri\/ =404/proxy_pass http:\/\/localhost:$port/g' file.txt
apt install -y python3-certbot-nginx && certbot --nginx 
mv file.txt /etc/nginx/sites-enabled/$domain
/etc/init.d/nginx restart
