FROM alpine:latest

RUN	apk update && apk upgrade
RUN apk --no-cache add mariadb mariadb-common mariadb-client openrc

RUN	mkdir "/run/mysqld" && chown -R mysql /run/mysqld
COPY my.cnf /etc/
COPY init.sh .
RUN	chmod +x init.sh

VOLUME	["/sys/fs/cgroup"]
VOLUME	["/var/lib/mysql"]
EXPOSE	3306
ENTRYPOINT ["./init.sh"]