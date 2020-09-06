FROM alpine:latest

RUN sed -e 's;^#http\(.*\)/v3.6/community;http\1/v3.6/community;g' -i /etc/apk/repositories

RUN cat /etc/apk/repositories

RUN apk --update --no-cache add shadow ejabberd

RUN addgroup -g 999 -S ejabberd && adduser -g 999 -S ejabberd -G ejabberd

EXPOSE 1883 4369-4399 5222

ENTRYPOINT ["ejabberdctl"]
