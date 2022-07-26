# Glider

## 网络转发工具

支持多种协议的转发

其中一种使用场景就是在手机上用 `SS` 将网易云流量转发到服务器上的网易云音乐解锁服务，实现手机上也能听灰色歌曲（两个服务要在同一个网络）

```yml
command: -verbose -listen ss://加密方式:密码@:端口 -forward http://unblock-netease-music-enhanced:8080
```
