# nginx-proxy

## Nginx 自动配置反向代理工具

通常搭配 [acme-companion](../acme-companion) 一起使用可以实现证书自动处理和自动配置反向代理

### 证书和反代自动处理

```yml
environment:
  - VIRTUAL_HOST=域名
  - LETSENCRYPT_HOST=域名
```
