minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=30G
minikube addons enable metallb
minikube addons enable dashboard

eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)

docker build -t ngn srcs/nginx/
docker build -t wp_img srcs/wordpress/
docker build -t php_img srcs/phpmyadmin
docker build -t msql_img srcs/mysql
docker build -t grafana_img srcs/grafana
docker build -t ftps_img srcs/ftps
docker build -t influx_img srcs/influx

kubectl apply -f srcs/nginx/metallb.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/wordpress/wp.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadm.yaml
kubectl apply -f srcs/mysql/msql.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/influx/influx.yaml