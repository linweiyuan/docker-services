# Dnsmasq

## 轻量级内网 DNS 服务器

局域网内有些需求可以通过自定义 `DNS` 解决，或者通过自建 `DNS` 的方式加速某些网站的访问速度：[dnsmasq-china-list](https://github.com/felixonmars/dnsmasq-china-list)

但是需要注意，如果是用某些网络管理软件来设置网络的话，每次修改保存后，一旦重启，之前的配置就会被自动覆盖掉，又要再手动改成自定义 `DNS`

- 如果是 `systemd-resolved`，修改配置文件 `/etc/systemd/resolved.conf`，加上 `DNSStubListener=no` 可解决
- 或者直接修改文件 `/etc/resolv.conf`，加上自定义配置 `nameserver`，并且设置该文件不可变 `chattr +i /etc/resolv.conf`

### Dockerfile

```dockerfile
FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache dnsmasq
```
