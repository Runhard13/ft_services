#!/bin/zsh

#minikube start --vm-driver=virtualbox --disk-size="8000mb" --memory="3072mb"

#setting docker env variable
minikube docker-env
eval $(minikube -p minikube docker-env)

#enable addons
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard

#building images
docker build srcs/nginx/ -t nginx_image
docker build srcs/ftps/ -t ftps_image
docker build srcs/mysql/ -t mysql_image
docker build srcs/wordpress/ -t wordpress_image



#apply configs
kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml

minikube dashboard