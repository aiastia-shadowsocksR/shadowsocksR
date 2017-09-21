# Dockerfile for shadowsocksr

FROM alpine:3.6
MAINTAINER aiastia <aiastia079@gmail.com>

ENV SSR_SERVER_PORT 8080
ENV SSR_PASSWORD password
ENV SSR_METHOD chacha20
ENV SSR_PROTOCOL auth_aes128_md5
ENV SSR_OBFS http_simple

RUN apk update && \
    apk --no-cache upgrade && \
    apk --no-cache add libsodium git python && \
    cd ~ && \
    git clone -b abcd https://github.com/shadowsocksR-private/shadowsocksR.git && \
    cd ~shadowsocksR/shadowsocks

EXPOSE $SSR_SERVER_PORT
CMD ["python","server.py", "-c /tmp/ssr/1.json"]
