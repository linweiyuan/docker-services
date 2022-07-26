# Nacos

## 微服务中间件，支持服务注册发现，健康监测，动态配置等多种功能

如果使用 `MySQL`，需要执行初始化脚本：[nacos-mysql.sql](https://raw.githubusercontent.com/alibaba/nacos/develop/distribution/conf/nacos-mysql.sql)

以及

```sql
create user 'nacos' identified by 'nacos';
grant all on nacos.* to 'nacos'@'%';
flush privileges;
```
