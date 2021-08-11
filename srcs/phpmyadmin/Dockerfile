FROM alpine:3.12

COPY 	config.inc.php ./

RUN		apk update
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
RUN		apk add nginx
RUN		apk add wget
RUN		apk add bash
RUN		apk add supervisor
RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session mysql

RUN		mkdir run/nginx
RUN		mkdir -p ./run/php7
RUN		mkdir ./etc/telegraf

COPY	nginx.conf			./etc/nginx
COPY	supervisord.conf	./etc/supervisord.conf
COPY	telegraf.conf		./etc/telegraf

RUN		wget -q http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.1-all-languages.tar.gz
RUN		tar -xzf phpMyAdmin-5.0.1-all-languages.tar.gz
RUN		mv phpMyAdmin-5.0.1-all-languages var/www/phpmyadmin
RUN		mv config.inc.php var/www/phpmyadmin
RUN		rm -rf phpMyAdmin-5.0.1-all-languages.tar.gz
RUN		mkdir -p /var/www/phpmyadmin/tmp
RUN		chmod 777 /var/www/phpmyadmin

EXPOSE 5000

CMD		["usr/bin/supervisord"]