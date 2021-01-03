#!/bin/sh
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
echo "CREATE DATABASE wordpress;" |mysql -u root --skip-password
echo "CREATE USER 'user'@'%' IDENTIFIED BY 'password';" |mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';" |mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" |mysql -u root --skip-password
mysql -u root wordpress < wordpress.sql
/etc/init.d/mariadb stop
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
