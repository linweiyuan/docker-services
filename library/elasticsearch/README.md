# Elasticsearch

## 搜索引擎

ES 有一个限制：[Virtual memory | Elasticsearch Guide [8.3] | Elastic](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html)

在 Linux 系统上执行 `sysctl vm.max_map_count`，一般会返回默认值 `vm.max_map_count = 65530`，如果不加大这个参数，启动 ES 会报错

`bootstrap check failure [1] of [1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]`

两种解决方案

- 临时修改：`sudo sysctl -w vm.max_map_count=262144`
- 永久修改：加到配置文件`/etc/sysctl.conf` 里

### 插件

中文分词：（ES 版本要和插件版本一致，不然启动会报错）

- `ik`：[elasticsearch-analysis-ik](https://github.com/medcl/elasticsearch-analysis-ik/releases)
- `pinyin`：[elasticsearch-analysis-pinyin](https://github.com/medcl/elasticsearch-analysis-pinyin/releases)
