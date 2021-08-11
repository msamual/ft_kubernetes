
all: run

install:
	rm -rf ~/.minikube
	rm -rf ~/goinfre/.minikube
	minikube delete
	brew remove minikube
	brew install minikube
	cd ~
	brew unlink minikube
	brew link minikube
	mv ~/.minikube ~/goinfre
	ln -s ~/goinfre/.minikube ~/.minikube

run:
	bash setup.sh
	minikube dashboard

clean:
	minikube delete

re: clean run

nginx_re:
	kubectl delete deployment nginx-deployment
	kubectl delete svc nginx-service
	
	docker build -t ngn srcs/nginx
	kubectl	apply -f srcs/nginx/nginx.yaml

wordpress_re:
	kubectl delete deployment wordpress-deployment
	kubectl delete svc wordpress-service
	
	docker build -t wp_img srcs/wordpress
	kubectl	apply -f srcs/wordpress/wp.yaml

php_re:
	kubectl delete deployment php-deployment
	kubectl delete svc php-service
	
	docker build -t php_img srcs/phpmyadmin
	kubectl	apply -f srcs/phpmyadmin/phpmyadm.yaml

grafana_re:
	kubectl delete deployment grafana-deployment
	kubectl delete svc grafana-service

	docker build -t grafana_img srcs/grafana
	kubectl apply -f srcs/grafana/grafana.yaml

mysql_re:
	kubectl delete deployment mysql-deployment
	kubectl delete svc mysql-service

	docker build -t msql_img srcs/grafana
	kubectl apply -f srcs/mysql/msql.yaml

influx_re:
	kubectl delete deployment influx-deployment
	kubectl delete svc influx-service

	docker build -t influx_img srcs/influx
	kubectl apply -f srcs/influx/influx.yaml

ftps_re:
	kubectl delete deployment ftps-deployment
	kubectl delete svc ftps-service

	docker build -t ftps_img srcs/ftps
	kubectl apply -f srcs/ftps/ftps.yaml