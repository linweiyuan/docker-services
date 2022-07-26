# Jenkins

## CI/CD 工具

### Dockerfile

```dockerfile
FROM jenkins/jenkins:alpine

USER root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache docker yarn npm tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && npm i -g vue-cli --registry=https://registry.npm.taobao.org
```
