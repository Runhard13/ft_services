FROM alpine:latest

RUN apk update && apk upgrade
RUN apk --no-cache add vsftpd
RUN apk --no-cache add openssl

RUN adduser -D user
RUN echo "user:password" | chpasswd

#SSL
RUN mkdir -p /etc/ftps/ssl
RUN mkdir -p /home/user/ftps/upload
RUN chmod 755 /home/user/ftps && chmod 755 /home/user/ftps/upload && chown -R user: /home/user/ftps/
RUN openssl req -newkey rsa:4096 \
                -x509 \
                -sha256 \
                -days 3650 \
                -nodes \
                -out /etc/ftps/ssl/certificate.crt \
                -keyout /etc/ftps/ssl/private.key \
                -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=ftps/CN=localhost"

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY start.sh .
RUN	chmod +x start.sh

EXPOSE 21 30021 20

ENTRYPOINT ["./start.sh"]