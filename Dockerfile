FROM alpine:latest

RUN sed -e 's;^#http\(.*\)/v3.12/community;http\1/v3.12/community;g' -i /etc/apk/repositories

RUN apk --update --no-cache add shadow

RUN apk --update --no-cache add -X http://dl-cdn.alpinelinux.org/alpine/v3.11/community erlang-crypto erlang-asn1 erlang-eldap erlang-mnesia erlang-public-key erlang-sasl erlang-ssl

RUN apk --update --no-cache add -X http://dl-cdn.alpinelinux.org/alpine/edge/testing ejabberd

EXPOSE 1883 4369-4399 5222

ENTRYPOINT ["ejabberdctl"]
