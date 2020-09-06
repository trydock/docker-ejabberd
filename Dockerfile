FROM alpine:latest

RUN sed -e 's;^#http\(.*\)/v3.12/community;http\1/v3.12/community;g' -i /etc/apk/repositories

RUN apk --update --no-cache add shadow

RUN apk --update --no-cache add -X http://dl-cdn.alpinelinux.org/alpine/v3.11/community erlang-crypto

RUN apk --update --no-cache add -X http://dl-cdn.alpinelinux.org/alpine/edge/testing ejabberd

RUN addgroup -g 999 -S ejabberd && adduser -g 999 -S ejabberd -G ejabberd

EXPOSE 1883 4369-4399 5222

ENTRYPOINT ["ejabberdctl"]
