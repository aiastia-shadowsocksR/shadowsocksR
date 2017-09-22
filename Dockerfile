FROM alpine:3.6

ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     51348
ENV PASSWORD        psw
ENV METHOD          aes-128-ctr
ENV PROTOCOL        auth_aes128_md5
ENV PROTOCOLPARAM   32
ENV OBFS            tls1.2_ticket_auth_compatible
ENV TIMEOUT         300
ENV DNS_ADDR        8.8.8.8
ENV DNS_ADDR_2      8.8.4.4

ARG BRANCH=abcd
ARG WORK=~
ARG URL=https://raw.githubusercontent.com/aiastia/k-z/master/config.json


RUN apk --no-cache add python \
    libsodium \
    wget


RUN mkdir -p $WORK && \
    wget -qO- --no-check-certificate https://github.com/shadowsocksR-private/shadowsocksR/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK



WORKDIR $WORK/shadowsocksR-$BRANCH/shadowsocks


RUN wget -O 1.json --no-check-certificate $URL && \
    cp 1.json /root
    
  



EXPOSE $SERVER_PORT
CMD ["python server.py", "-c /root/1.json"]
