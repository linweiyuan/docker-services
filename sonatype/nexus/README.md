# Sonatype Nexus3

## 支持多系统的包管理工具

容器内权限是 `nexus:nexus`，对应是 `200:200`，因此需要对挂载目录设置权限

```bash
chown -R 200:200 data
```
