# Traefik

## 反向代理和负载均衡工具

能够很好地与其他的 Docker 容器进行整合，自动配置容器，因为挂载了 `/var/run/docker.sock` 进 Traefik 容器里

通过命令 `--api.insecure=true`，可以将 dashboard 通过 8080 端口暴露出来；而 `--providers.docker` 则指明使用 docker 作为 provider（如果使用 Kubernetes 则 `--providers.kubernetesingress`）
