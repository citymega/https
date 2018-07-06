FROM alpine:latest

LABEL maintainer Citymega <citymega@gmail.com>

ENV TZ=America/Toronto

RUN apk add --no-cache apache2-ssl tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    apk del --no-cache tzdata && \
    mkdir -p /run/apache2 && \
    rm -f /etc/apache2/conf.d/info.conf && \
    rm -f /etc/apache2/conf.d/userdir.conf

EXPOSE 80 443

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
