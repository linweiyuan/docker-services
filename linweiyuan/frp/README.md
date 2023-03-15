# FRP

## 内网穿透工具

### Dockerfile

```dockerfile
FROM alpine

ENV FRP_VERSION 0.48.0

RUN wget -qO- https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz | tar zxf - \
    && cp frp*/frp* /usr/bin \
    && rm -rf frp* /usr/bin/frp*.ini
```
