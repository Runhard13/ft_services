#!/bin/sh
/usr/bin/supervisord -c /etc/supervisord.conf
chown -R www:www /var/lib/nginx/