# Adminer

## 轻量级数据库管理软件，单页面，B/S 架构

默认配置文件所在路径：`/usr/local/etc/php/conf.d/upload_large_dumps.ini`

如果 `SQL` 文件过大，导入时会报错，可通过修改配置参数的方式来修复

```ini
upload_max_filesize = 500M
post_max_size       = 500M
memory_limit        = -1
max_execution_time  = 0
```

### Dockerfile

```dockerfile
FROM adminer

USER root

RUN    echo "upload_max_filesize = 500M" >> /usr/local/etc/php/conf.d/upload_large_dumps.ini \
    && echo "post_max_size       = 500M" >> /usr/local/etc/php/conf.d/upload_large_dumps.ini \
    && echo "memory_limit        = -1"   >> /usr/local/etc/php/conf.d/upload_large_dumps.ini \
    && echo "max_execution_time  = 0"    >> /usr/local/etc/php/conf.d/upload_large_dumps.ini

VOLUME /sessions

USER adminer

EXPOSE 8080
```
