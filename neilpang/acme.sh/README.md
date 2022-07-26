# An ACME Shell script: acme.sh

## 证书生成工具

### 泛域名

```yml
command: acme.sh --issue --dns dns_ali -d 域名 -d *.域名 --server letsencrypt
```

### 集成阿里云解析 DNS

- 配置好阿里云上生成的的 `key` 和 `secret`

  ```yml
  environment:
    - Ali_Key=key
    - Ali_Secret=secret
  ```

- 需要定义 `Nginx` 容器中的证书存放路径

  ```yml
  environment:
    - DEPLOY_DOCKER_CONTAINER_LABEL=sh.acme.autoload.domain=
    - DEPLOY_DOCKER_CONTAINER_KEY_FILE=
    - DEPLOY_DOCKER_CONTAINER_CERT_FILE=
    - DEPLOY_DOCKER_CONTAINER_CA_FILE=
    - DEPLOY_DOCKER_CONTAINER_FULLCHAIN_FILE=
    - DEPLOY_DOCKER_CONTAINER_RELOAD_CMD="service nginx force-reload"
  ```

  负责证书配置的 `Nginx` 容器需要配置 `label` （和上面的配置要一致）来让 acme.sh 容器找到它并重启使证书续签生效

  ```yml
  labels:
    - sh.acme.autoload.domain=
  ```
