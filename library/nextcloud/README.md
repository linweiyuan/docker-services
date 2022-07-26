# Nextcloud

## 私人云盘

初始化脚本

```sql
create user 'nextcloud' identified by 'nextcloud';
grant all on nextcloud.* to 'nextcloud'@'%';
flush privileges;
```
