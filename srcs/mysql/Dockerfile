FROM alpine:latest

RUN	apk update && apk upgrade
RUN	apk add mariadb mariadb-common mariadb-client openrc

COPY init.sh .
RUN	chmod +x init.sh

VOLUME	["/sys/fs/cgroup"]
VOLUME	["/var/lib/mysql"]
EXPOSE	3306
ENTRYPOINT ["./init.sh"]