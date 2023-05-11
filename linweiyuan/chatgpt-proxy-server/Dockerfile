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
    && sudo rm -rf google-chrome undetected-chromedriver .local \
    ' \
    && pacman -Rs --noconfirm python-setuptools python git base-devel \
    && rm -rf /usr/lib/python* \
    && echo -e "y\nY" | pacman -Scc

COPY run.sh run.sh

CMD ["/bin/bash", "/run.sh"]
