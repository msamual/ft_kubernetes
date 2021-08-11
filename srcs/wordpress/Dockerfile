FROM alpine:3.12

RUN		apk	update
RUN		apk add nginx

RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
RUN		apk add bash
RUN		apk add supervisor
RUN		apk add wget
RUN		apk add php7-iconv php7-json php7-mysqli php7-fpm

COPY	nginx.conf /etc/nginx
COPY	supervisord.conf /etc/supervisord.conf
RUN		mkdir ./etc/telegraf
COPY	telegraf.conf ./etc/telegraf

RUN		mkdir ./run/nginx

RUN		wget -q https://wordpress.org/latest.tar.gz
RUN		tar -xzf latest.tar.gz && rm -rf latest.tar.gz
RUN		mv wordpress var/www/
COPY	wp-config.php var/www/wordpress

RUN		rm -rf latest.tar.gz
RUN		chmod 777 var/www/wordpress

EXPOSE	5050

CMD		["usr/bin/supervisord"]