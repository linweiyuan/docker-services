# Trojan-Go

## 科学上网工具

性能较好，但是配置较为复杂

### Client 端

- `remote_addr` 为远程服务

### Server 端

- `remote_addr` 为非 `trojan` 流量返回的服务
- 可对网址进行限制（类似广告的效果），最简单粗暴的就是配置
  ```yml
  extra_hosts:
    - '域名:127.0.0.1'
  ```
- 需要将 `SSL` 证书挂载进去
- 更多详细配套基础设施配置可以查看 [nginx](../../library/nginx)
