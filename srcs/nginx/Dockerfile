FROM alpine:3.12

RUN		apk update
RUN		apk add supervisor
RUN		apk add nginx
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
RUN		apk add --no-cache nginx openssh openssl

RUN		mkdir run/nginx

RUN 	openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/key.pem -out etc/nginx/cert.pem -days 365 -subj '/C=RU/ST=RT/L=KAZAN/O=SCHOOL21/OU=21SCHOOL/CN=MSAMUAL' -nodes

COPY	nginx.conf			./etc/nginx
COPY	index.html			./var/www/
COPY	telegraf.conf		./etc/telegraf/
COPY	supervisord.conf	./etc/

RUN		cp ./etc/telegraf/telegraf.conf ./etc/

CMD		["usr/bin/supervisord"]