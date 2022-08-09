# Sentinel

官方 `dashboard` 下载地址：[sentinel-dashboard](https://github.com/alibaba/Sentinel/releases)，隐藏了部分实现细节，如需集成 `Nacos`实现规则持久化，需修改源码手动打包（当前最新版本 `1.8.5`），步骤如下

- 修改 `sentinel-dashboard` 模块依赖，允许 `sentinel-datasource-nacos` 依赖在测试外使用

```xml
<dependency>
    <groupId>com.alibaba.csp</groupId>
    <artifactId>sentinel-datasource-nacos</artifactId>
    <!-- <scope>test</scope> -->
</dependency>
```

- 将 `src/test` 下 `com.alibaba.csp.sentinel.dashboard.rule.nacos` 复制一份到 `src/main` 中
  - `FlowRuleNacosProvider.java`
  - `FlowRuleNacosPublisher.java`
  - `NacosConfig.java`
  - `NacosConfigUtil.java`
- 修改 Nacos 地址，在 `NacosConfig.java` 中配置了 Nacos 服务器地址，但是不是默认的 `8848` 端口，修改方式多种多样，测试的时候，写死或者配置文件或者变量都可以

```java
@Value("${nacos.server.host}")
private String nacosServerHost;
@Value("${nacos.server.port}")
private int nacosServerPort;

@Bean
public ConfigService nacosConfigService() throws Exception {
    // return ConfigFactory.createConfigService("localhost");
    return ConfigFactory.createConfigService(nacosServerHost + ":" + nacosServerPort);
}
```

提供外部修改变量入口

```ini
nacos.server.host=nacos
nacos.server.port=8848
```

- 使用新的 `Provider` 和 `Publisher`，修改类`com.alibaba.csp.sentinel.dashboard.controller.v2.FlowControllerV2`
  - `flowRuleDefaultProvider` -> `flowRuleNacosProvider`
  - `flowRuleDefaultPublisher` -> `flowRuleNacosPublisher`
- 把前端页面隐藏的菜单显示出来，修改文件，放开流控规则 V1，可以换个名字

```html
<li ui-sref-active="active" ng-if="entry.appType==0">
  <a ui-sref="dashboard.flow({app: entry.app})">
    <i class="glyphicon glyphicon-filter"></i>&nbsp;&nbsp;流控规则 (Nacos)</a
  >
</li>
```

- 重新打包

```dockerfile
FROM openjdk:8-jdk-alpine
COPY sentinel-dashboard.jar a.jar
CMD ["/bin/bash"]
ENTRYPOINT ["java","-XX:+UnlockExperimentalVMOptions","-XX:+UseCGroupMemoryLimitForHeap","-Djava.security.egd=file:/dev/./urandom","-jar","/a.jar"]
```
