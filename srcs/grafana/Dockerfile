FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk --no-cache add grafana

COPY dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards
COPY datasources.yaml.yaml /usr/share/grafana/conf/provisioning/datasources

EXPOSE 3000
CMD	/usr/sbin/grafana-server --homepath=/usr/share/grafana