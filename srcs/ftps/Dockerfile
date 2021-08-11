FROM alpine:3.12

RUN		apk update
RUN		apk add bash
RUN		apk add vsftpd
RUN		apk add supervisor
RUN		apk add openssl
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted

COPY	telegraf.conf		./etc/telegraf/
COPY	supervisord.conf	./etc/
COPY	vsftpd.conf			./etc/vsftpd/vsftpd.conf

RUN		openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -subj '/CN=localhost' -nodes

RUN		mkdir	-p		./var/msamual
RUN		chmod	777		./var/msamual
RUN		chmod	777		./etc/vsftpd/vsftpd.conf
RUN		adduser	-D		msamual && echo "msamual:3347" | chpasswd

EXPOSE	21 20021

CMD		["/usr/bin/supervisord"]