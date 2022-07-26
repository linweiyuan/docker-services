# Gitea

## 轻量级 Git 代码托管服务

由 [Gogs](https://github.com/gogs/gogs) 分支出来

初始化脚本

```sql
create user 'gitea' identified by 'gitea';
grant all on gitea.* to 'gitea'@'%';
flush privileges;
```
