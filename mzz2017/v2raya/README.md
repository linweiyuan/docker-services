# v2rayA

## 科学上网工具

### 网易云音乐 RoutingA 规则

[解锁网易云灰色歌曲
](https://v2raya.org/docs/advanced-application/unblock-netease-cloud)

```ini
outbound: unblockneteasemusic = http(address:"127.0.0.1", port:"8080")

default: proxy

# 下一行是为安卓设备准备的, 如果你不使用安卓设备，请你移除下一行，否则这将有可能影响到听歌记录。
domain(regexp:clientlog\d*.music.163.com)->block
domain(domain:163.com,domain:netease.com) && source(172.16.0.0/12)->direct
domain(domain:163.com,domain:netease.com)->unblockneteasemusic

domain(geosite:geolocation-!cn)->proxy
domain(geosite:google-scholar)->proxy
domain(geosite:cn, geosite:category-scholar-!cn, geosite:category-scholar-cn)->direct
ip(geoip:hk,geoip:mo)->proxy
ip(geoip:private, geoip:cn)->direct

```

### 版本 1.5.9.1698

报错信息

```
panic: Something in this program imports go4.org/unsafe/assume-no-moving-gc to declare that it assumes a non-moving garbage collector, but your version of go4.org/unsafe/assume-no-moving-gc hasn't been updated to assert that it's safe against the go1.19 runtime. If you want to risk it, run with environment variable ASSUME_NO_MOVING_GC_UNSAFE_RISK_IT_WITH=go1.19 set. Notably, if go1.19 adds a moving garbage collector, this program is unsafe to use.
```

解决方案

```yml
environment:
  - ASSUME_NO_MOVING_GC_UNSAFE_RISK_IT_WITH=go1.19
```
