# Registry

## Docker 私有仓库

默认配置文件所在路径：`/etc/docker/registry/config.yml`

完整配置文件可参考 `docker compose` 官方：[Configuring a registry | Docker Documentation](https://docs.docker.com/registry/configuration/)

如果要配置登录验证，可以用 `htpasswd` 工具

```bash
htpasswd -Bb -c 文件名 用户名 密码
```

设置环境变量

```yml
environment:
  - REGISTRY_AUTH=htpasswd
  - REGISTRY_AUTH_HTPASSWD_REALM=Auth
  - REGISTRY_AUTH_HTPASSWD_PATH=/htpasswd
```
