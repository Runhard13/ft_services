FROM alpine:latest

#install all
RUN apk update && apk upgrade
RUN apk --no-cache add nginx openssl openssh supervisor

RUN	adduser -D -g 'www' www
RUN	echo "www:www" | chpasswd

RUN	mkdir /www && chown -R www:www /www
RUN	chown -R www:www /var/lib/nginx

#Nginx
RUN mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html www/index.html

#SSL
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 \
                -x509 \
                -sha256 \
                -days 3650 \
                -nodes \
                -out /etc/nginx/ssl/certificate.crt \
                -keyout /etc/nginx/ssl/private.key \
                -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=nginx/CN=localhost"

#SSH
RUN ssh-keygen -A

#supervisord
COPY supervisord.conf /etc/supervisord.conf
RUN	chmod +rw /etc/supervisord.conf

EXPOSE 80 443 22
CMD /usr/bin/supervisord -c /etc/supervisord.conf
