#! /bin/bash

touch /var/API-Dev/helloworld

mv /var/API-Dev/API-conf.json /var/www
sed -i "s/short_open_tag = .*/short_open_tag = On/" /etc/php/8.1/apache2/php.ini
/usr/sbin/apache2ctl -D FOREGROUND