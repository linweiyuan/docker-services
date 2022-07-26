# Redis

## 高性能缓存中间件

`Redis 7.0` 版本完整配置文件：[redis.conf](https://raw.githubusercontent.com/redis/redis/7.0/redis.conf)

如需配置远程登录，需要做如下步骤

- 注释 `bind 127.0.0.1`
- 修改 `protected-mode` 为 `no`
- 设置密码 `requirepass` （可选）

### Redis 一主两从

该模式下中，默认是主节点才可写，如果在从节点上写数据，会报错

`Connection error: READONLY You can't write against a read-only replica. `

这个是由 `replica-read-only` 属性控制的，默认为 `yes`，如果硬是要在从节点上也能写，将其改为 `no`

这种情况，在该从节点上创建的的数据不会同步到其他主从节点
