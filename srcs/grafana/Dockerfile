FROM alpine:3.12

RUN apk update
RUN apk add bash
RUN apk add supervisor
RUN apk add wget
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/ --allow-untrusted
RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted

COPY supervisord.conf	./etc/supervisord.conf
COPY telegraf.conf		./etc/telegraf/
COPY grafana.db		./usr/share/grafana/data/grafana.db

EXPOSE 3000

CMD ["usr/bin/supervisord"]