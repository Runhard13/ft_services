#!/bin/sh

minikube start --vm-driver=virtualbox --disk-size="8000mb" --memory="3072mb"

#setting docker env variable
minikube docker-env
eval $(minikube -p minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

#enable addons
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard

#building images
docker build srcs/nginx/ -t nginx_image
docker build srcs/ftps/ -t ftps_image
docker build srcs/mysql/ -t mysql_image
docker build srcs/wordpress/ -t wordpress_image
docker build srcs/phpmyadmin/ -t pma_image
docker build srcs/grafana/ -t grafana_image
docker build srcs/influxdb/ -t influxdb_image
docker build srcs/telegraf -t telegraf_image



#apply configs
kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/phpmyadmin/pma.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/telegraf/telegraf.yaml

minikube dashboard


# curl -I http://192.168.99.111
# kubectl exec deploy/ftps -- pkill vsftpd
# kubectl exec deploy/grafana -- pkill grafana
# kubectl exec deploy/telegraf -- pkill telegraf
# kubectl exec deploy/influxdb -- pkill influx
# kubectl exec deploy/wordpress -- pkill nginx
# kubectl exec deploy/wordpress -- pkill php-fpm7
# kubectl exec deploy/phpmyadmin -- pkill nginx
# kubectl exec deploy/phpmyadmin -- pkill php-fpm7
# kubectl exec deploy/mysql -- pkill /usr/bin/mysqld
# kubectl exec deploy/nginx -- pkill nginx
# kubectl exec deploy/nginx -- pkill sshd