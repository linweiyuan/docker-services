FROM alpine

ENV FRP_VERSION 0.51.1

RUN wget -qO- https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz | tar zxf - \
    && cp frp*/frp* /usr/bin \
    && rm -rf frp* /usr/bin/frp*.ini
