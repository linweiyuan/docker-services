# Redis Sentinel

## Redis 哨兵机制

完整配置文件：[sentinel.conf](https://download.redis.io/redis-stable/sentinel.conf)

如果不是使用 `IP` 直连，需要将 `resolve-hostnames` 改为 `yes`

```ini
SENTINEL resolve-hostnames yes
```
