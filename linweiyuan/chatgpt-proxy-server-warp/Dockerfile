FROM archlinux

ENV SUDO_USER_NAME linweiyuan
ENV MIRROR_URL 'https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch'

RUN echo "Server = ${MIRROR_URL}" > /etc/pacman.d/mirrorlist \
    && pacman -Sy --needed --noconfirm \
    && pacman -S base-devel git socat --needed --noconfirm \
    && useradd -m ${SUDO_USER_NAME} \
    && echo "${SUDO_USER_NAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers \
    && su ${SUDO_USER_NAME} -c 'cd \
    && git clone https://aur.archlinux.org/cloudflare-warp-bin.git \
    && cd cloudflare-warp-bin \
    && source PKGBUILD \
    && sudo pacman -Syu --asdeps --needed --noconfirm "${makedepends[@]}" "${depends[@]}" \
    && makepkg -sir --noconfirm \
    && cd \
    && sudo rm -rf cloudflare-warp-bin \
    ' \
    && pacman -Rs --noconfirm git base-devel \
    && echo -e "y\nY" | pacman -Scc

COPY run.sh run.sh

CMD ["/bin/bash", "/run.sh"]
