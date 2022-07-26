# SSH

## SSH 跳板转发工具

此工具可用一台服务器充当跳板，遇到的场景就是云上的数据库名字太长又是随机字符记不住，把它转发成本地端口连上去

用法

```yml
command: ssh -o StrictHostKeyChecking=no -4 -p 远程服务器端口 -NL 容器内端口:要通过本地端口连过去的远程服务:远程服务的端口 跳板机用户名@跳板机地址
```

配置好端口映射

```yml
ports:
  - 容器外端口:容器内端口
```

### Dockerfile

```dockerfile
FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache openssh
```
