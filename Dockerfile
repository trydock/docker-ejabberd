FROM alpine:latest

RUN sed -e 's;^#http\(.*\)/v3.6/community;http\1/v3.6/community;g' -i /etc/apk/repositories

RUN apk --update --no-cache add shadow ejabberd
