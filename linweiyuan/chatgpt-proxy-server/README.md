# chatgpt-proxy-server

## ChatGPT 代理服务器

利用 [undetected_chromedriver](https://github.com/ultrafunkamsterdam/undetected-chromedriver) 绕过 Cloudflare 403

监听 `9515` 端口，通过原生 JS 发送 XHR 来进行通信

### Dockerfile

基于 `Arch Linux`（Arch 是真的好用，我连自己的服务器都用 Arch，从未滚挂）-> `Dockerfile`

修改 `MIRROR_URL` 为 Arch 最优源的同时，要注意网络环境能正确处理 AUR 和 GitHub 上面的资源

---

基于 `Ubuntu`，最终镜像比 `Arch` 能减少一百兆左右

本来尝试整个 `arm` 的镜像，但是 `google-chrome` 没有提供对应版本安装包 -> `Dockerfile.ubuntu`
