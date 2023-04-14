# chatgpt-proxy-server

## ChatGPT 代理服务器

利用 [undetected_chromedriver](https://github.com/ultrafunkamsterdam/undetected-chromedriver) 绕过 Cloudflare 403

监听 `9515` 端口，通过原生 JS 发送 XHR 来进行通信

### Dockerfile

基于 `Arch Linux`（Arch 是真的好用，我连自己的服务器都用 Arch，从未滚挂）

```dockerfile
FROM archlinux

ENV SUDO_USER_NAME linweiyuan
ENV MIRROR_URL 'https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch'

RUN echo "Server = ${MIRROR_URL}" > /etc/pacman.d/mirrorlist \
    && pacman -Sy --needed --noconfirm \
    && pacman -S base-devel git --needed --noconfirm \
    && useradd -m ${SUDO_USER_NAME} \
    && echo "${SUDO_USER_NAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers \
    && su ${SUDO_USER_NAME} -c 'cd \
        && git clone https://aur.archlinux.org/google-chrome.git \
        && cd google-chrome \
        && source PKGBUILD \
        && sudo pacman -Syu --asdeps --needed --noconfirm "${makedepends[@]}" "${depends[@]}" \
        && makepkg -sir --noconfirm \
        && cd \
        && git clone https://github.com/ultrafunkamsterdam/undetected-chromedriver \
        && cd undetected-chromedriver \
        && sudo pacman -S --needed --noconfirm python python-setuptools \
        && sudo python setup.py install \
        && (python example/example.py &) \
        && while true; do [ -f ~/.local/share/undetected_chromedriver/undetected_chromedriver ] && sudo cp ~/.local/share/undetected_chromedriver/undetected_chromedriver / && break || sleep 1; done \
        && cd \
        && sudo rm -rf google-chrome undetected-chromedriver \
    ' \
    && pacman -Rs --noconfirm python-setuptools python git base-devel \
    && rm -rf /usr/lib/python* \
    && echo -e "y\nY" | pacman -Scc

CMD ["./undetected_chromedriver", "--allowed-ips=", "--allowed-origins=*"]
```

修改 `MIRROR_URL` 为 Arch 最优源的同时，要注意网络环境能正确处理 AUR 和 GitHub 上面的资源

---

基于 `Ubuntu`，最终镜像比 `Arch` 能减少一百兆左右

本来尝试整个 `arm` 的镜像，但是 `google-chrome` 没有提供对应版本安装包

```dockerfile
FROM ubuntu

RUN apt update && apt install -y wget git python3-setuptools && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && dpkg -i google-chrome-stable_current_amd64.deb || apt -f -y install \
    && git clone https://github.com/ultrafunkamsterdam/undetected-chromedriver \
    && cd undetected-chromedriver \
    && python3 setup.py install \
    && (python3 example/example.py &) \
    && while true; do [ -f ~/.local/share/undetected_chromedriver/undetected_chromedriver ] && cp ~/.local/share/undetected_chromedriver/undetected_chromedriver / && break || sleep 1; done \
    && cd \
    && rm -rf undetected-chromedriver \
    && apt remove -y wget git python3-setuptools \
    && rm -rf /usr/local/lib/python* \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["./undetected_chromedriver", "--allowed-ips=", "--allowed-origins=*"]
```
