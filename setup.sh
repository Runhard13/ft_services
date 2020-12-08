#!/bin/zsh

#minikube start --vm-driver=virtualbox --disk-size="7000mb" --memory="3000mb"

#set place for docker images
minikube docker-env
eval $(minikube -p minikube docker-env)

#enable metallb
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard

#images
docker build srcs/nginx/ -t nginx_image



#apply config
kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx/nginx.yaml