FROM alpine:3.9.4

RUN apk --no-cache add squid inotify-tools

COPY entrypoint.sh /opt/

CMD sh /opt/entrypoint.sh
