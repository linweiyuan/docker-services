# acme-companion

## HTTPS 证书自动处理工具

通常搭配 [nginx-proxy](../nginx-proxy) 一起使用

配置正确的邮箱，可以接收相关邮件

```yml
environment:
  - DEFAULT_EMAIL=你的邮箱
```

### 证书和反代自动处理

```yml
environment:
  - VIRTUAL_HOST=域名
  - LETSENCRYPT_HOST=域名
```

需要和 `nginx-proxy` 容器共享部分目录

- `/etc/nginx/certs`：放生成的证书
- `/etc/nginx/vhost.d`：生成证书用 `http-01` 验证域名所有权
- `/usr/share/nginx/html`：同上
