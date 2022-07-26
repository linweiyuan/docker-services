# MySQL

## 高性能关系型数据库

### MySQL 一主两从

- 主节点
  配置忽略的数据库，可以分开写或者写成一行逗号隔开

  ```ini
  binlog-ignore-db=mysql
  binlog-ignore-db=information_schema
  binlog-ignore-db=performance_schema
  binlog-ignore-db=sys
  ```

- 查询 `bin-log` 文件名称和同步位置

  ```sql
  show master status;
  ```

- 从节点
  连接主节点

  ```sql
  change master to master_host='mysql-master', master_user='root', master_password='toor', master_log_file='mysql-bin.000000', master_log_pos=0;
  ```

- 开启服务

  ```sql
  start slave;
  ```

- 查看状态

  ```sql
  show slave status;
  ```
