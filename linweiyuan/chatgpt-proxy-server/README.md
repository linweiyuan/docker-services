# chatgpt-proxy-server

## ChatGPT 代理服务器

利用 [undetected_chromedriver](https://github.com/ultrafunkamsterdam/undetected-chromedriver) 绕过 Cloudflare 403

监听 `9515` 端口，通过原生 JS 发送 XHR 来进行通信

### Dockerfile

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
