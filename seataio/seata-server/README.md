# Seata

## 分布式事务解决方案

初始化脚本下载地址（当前 `1.5.2` 版本）：[script](https://github.com/seata/seata/tree/1.5.2/script)

`1.5.2` 和 `1.4.2` 相比改动较大，可以从源代码或者容器内拿到
`resources` 文件夹，修改配置后重新挂载进去覆盖掉

```yml
volumes:
  - ./resources:/seata-server/resources
```

### 集成 Nacos

完整配置文件文件夹：[config-center](https://github.com/seata/seata/tree/develop/script/config-center)

修改 `config.txt` 完后进入 `nacos` 文件夹，执行 `nacos-config.sh` 脚本即可完成初始化工作，将需要的属性持久化到 `nacos` 中
