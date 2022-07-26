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
