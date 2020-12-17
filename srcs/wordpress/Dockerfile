FROM alpine:latest

RUN	apk update && apk upgrade
RUN apk add --no-cache supervisor nginx

RUN	adduser -D -g 'www' www
RUN	mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www

#configure wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
COPY wp-config.php /www/wordpress

RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html www/index.html