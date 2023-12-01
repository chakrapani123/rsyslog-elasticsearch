FROM alpine:3.10.6
RUN apk add --no-cache \
    make ca-certificates rsyslog rsyslog-elasticsearch rsyslog-mmjsonparse jq curl supervisor \
RUN mkdir /etc/rsyslog.d
RUN mkdir /etc/vault.d
COPY ./build/service.ini /etc/supervisor.d/service.ini
RUN sed -i 's/;nodaemon=false/nodaemon=true/g' /etc/supervisord.conf
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisord.conf"]
