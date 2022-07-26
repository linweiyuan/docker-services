# Canal

## 阿里巴巴 MySQL binlog 增量订阅 & 消费组件

伪装成 `MySQL` 从节点，接收主节点的数据同步推送，由于基于 `binlog` 技术，因此需要开启 `binlog`（默认开启），`Canal` 源代码里有很多 `mysql-bin` 硬编码，为了避免不必要的麻烦，因此需要配置成该文件名，`binlog-format` 的话高版本 MySQL 默认就是 `ROW`

```ini
log-bin=mysql-bin
binlog-format=ROW
```

另外由于是模拟成从节点，因此需要部分数据库权限

```sql
create user canal identified by 'canal';
grant select, replication slave, replication client on *.* to 'canal'@'%';
-- grant all privileges on *.* to 'canal'@'%' ;
flush privileges;
```
