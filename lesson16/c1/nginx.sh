#!/bin/sh
apk add curl
apk add nginx
adduser -D -g 'www' www
chown -R www:www /opt/www
