# Watchtower

## 容器镜像版本监控工具

### 检查更新间隔

默认 `24` 小时检查一次更新，如需修改时间间隔可以覆盖默认运行命令，以秒为单位

```yml
command: --interval 30
```

### 通知

支持多种通知方式，包括 `email`、`slack`、`msteams`、`msteams` 等

邮件通知

```yml
environment:
  - WATCHTOWER_NOTIFICATIONS=email
  - WATCHTOWER_NOTIFICATION_EMAIL_FROM=发件方邮箱
  - WATCHTOWER_NOTIFICATION_EMAIL_TO=收件方邮箱
  - WATCHTOWER_NOTIFICATION_EMAIL_SERVER=SMTP服务器地址
  - WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT=SMTP服务器端口
  - WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=发件方邮箱
  - WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=发件方邮箱密码（授权码）
```

还有其他很多实用的功能
