FROM archlinux

ENV SUDO_USER_NAME linweiyuan
ENV ARCHLINUX_MIRROR_URL 'https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch'
ENV ARCHLINUXCN_MIRROR_URL 'https://mirrors.bfsu.edu.cn/archlinuxcn/$arch'

RUN echo "Server = ${ARCHLINUX_MIRROR_URL}" > /etc/pacman.d/mirrorlist \
    && pacman -Sy --needed --noconfirm \
    && pacman -S base-devel git python socat --needed --noconfirm \
    && useradd -m ${SUDO_USER_NAME} \
    && echo "${SUDO_USER_NAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers \
    && su ${SUDO_USER_NAME} -c 'cd \
    && git clone https://aur.archlinux.org/google-chrome.git \
    && cd google-chrome \
    && source PKGBUILD \
    && sudo pacman -Syu --asdeps --needed --noconfirm "${makedepends[@]}" "${depends[@]}" \
    && makepkg -sir --noconfirm \
    && cd \
    && sudo rm -rf google-chrome \
    ' \
    && pacman -Rs --noconfirm git base-devel \
    && sed -i 's/Required DatabaseOptional/Never/g' /etc/pacman.conf \
    && echo -e "\n[archlinuxcn]" >> /etc/pacman.conf \
    && echo "Server = ${ARCHLINUXCN_MIRROR_URL}" >> /etc/pacman.conf \
    && pacman -Sy --needed --noconfirm \
    && pacman -S chromedriver --needed --noconfirm \
    && echo -e "y\nY" | pacman -Scc

COPY run.sh run.sh
COPY arkose.html arkose.html

CMD ["/bin/bash", "/run.sh"]
