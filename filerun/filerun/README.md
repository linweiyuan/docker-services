# Filerun

## 轻量级私人云盘

启动后默认用户名密码都是 `superuser`，第一次登录强制要求修改密码

初始化脚本

```sql
create user 'filerun' identified by 'filerun';
grant all on filerun.* to 'filerun'@'%';
flush privileges;
```
