# chatgpt-proxy-server-warp

## ChatGPT 代理服务器 with WARP

利用 [Cloudflare WARP](https://developers.cloudflare.com/warp-client/get-started/linux/) 绕过 ChatGPT `Access denied`

实现步骤：

- 开启 `proxy` 模式，避免全部流量走 Cloudflare

- 利用 `socat` 将服务监听地址 `127.0.0.1:40000` 转为 `0.0.0.0:65535` 供外部使用，其实容器本身不暴露端口出去公网，风险不大

细节的原理，坦白说不是很懂，计算机网络的知识，早还给老师了

另外就是每次开启都会跑 `register`，如何将账号配置持久化，还有其他高阶玩法比如刷流量，解锁 `plus`，还没玩明白
