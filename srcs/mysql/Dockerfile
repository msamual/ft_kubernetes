FROM	alpine:3.12

RUN		apk update
RUN		apk add bash
RUN		apk add mariadb mariadb-client openrc
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
RUN		mkdir "/run/mysqld" && chown -R mysql /run/mysqld
RUN		mkdir ./etc/telegraf
RUN		chmod 777 ./etc/telegraf

COPY	my.cnf ./etc
COPY	wordpress.sql ./
COPY	start.sh ./
COPY	telegraf.conf ./etc/telegraf/

VOLUME	["/var/lib/mysql"]

EXPOSE	3306

CMD		bash start.sh