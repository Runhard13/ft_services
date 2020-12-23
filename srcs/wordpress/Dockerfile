FROM alpine:latest

RUN	apk update && apk upgrade
RUN apk add --no-cache supervisor nginx openrc wget
RUN apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-json

RUN	adduser -D -g 'www' www
RUN echo "www:www" | chpasswd
RUN	mkdir /www &&  chown -R www:www /www
RUN mkdir /run/nginx && chown -R www:www /run/nginx/


#configure wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm latest.tar.gz
RUN mv wordpress /www/
COPY wp-config.php www/wordpress/

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 5050
COPY init.sh .
RUN	chmod +x init.sh
ENTRYPOINT ["./init.sh"]