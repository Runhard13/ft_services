FROM alpine:latest

RUN	apk update && apk upgrade
RUN apk add --no-cache supervisor nginx openrc wget
RUN apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-json php7-mbstring php7-session

RUN	adduser -D -g 'www' www
RUN echo "www:www" | chpasswd
RUN	mkdir /www &&  chown -R www:www /www
RUN mkdir /run/nginx && chown -R www:www /run/nginx/

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xvzf phpMyAdmin-5.0.4-all-languages.tar.gz && rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /www/pma
RUN mkdir /www/pma/tmp && chmod 777 /www/pma/tmp
COPY config.inc.php /www/pma/

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 5000
COPY init.sh .
RUN	chmod +x init.sh
ENTRYPOINT ["./init.sh"]