#!/usr/bin/bash
apt update
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y tzdata
apt install -y apache2 ghostscript libapache2-mod-php php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip
mkdir -p /srv/www
chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
a2ensite wordpress
a2enmod rewrite
a2dissite 000-default
