FROM	alpine:3.12

RUN		apk update
RUN		apk add influxdb
RUN		apk add bash
RUN		apk add supervisor
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted

RUN		mkdir ./etc/telegraf
RUN		mkdir ./etc/influxdb

COPY	telegraf.conf		./etc/telegraf/
COPY	supervisord.conf	./etc/
COPY	start.sh			./

RUN		chmod 777 start.sh
RUN		cp ./etc/telegraf/telegraf.conf ./etc/
RUN		cp ./etc/influxdb.conf /etc/influxdb/

EXPOSE	8086 8088

VOLUME	["/var/lib/influxdb"]

CMD		["usr/bin/supervisord"]