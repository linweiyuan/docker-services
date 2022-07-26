# Rabbitmq

## 高性能消息队列中间件

### 插件

插件下载下来，挂载到容器内 `/plugins` 目录，同时配置插件启用 `/etc/rabbitmq/enabled_plugins`

`Erlang` 语法特殊，插件启用配置文件最后的点号不能少，比如

```ini
[rabbitmq_prometheus, rabbitmq_management, rabbitmq_delayed_message_exchange].
```

### 延迟队列

下载地址：[rabbitmq_delayed_message_exchange](https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases)
