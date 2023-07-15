FROM archlinux

ENV SUDO_USER_NAME linweiyuan
ENV ARCHLINUX_MIRROR_URL 'https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch'

RUN echo "Server = ${ARCHLINUX_MIRROR_URL}" > /etc/pacman.d/mirrorlist \
    && pacman -Sy --needed --noconfirm \
    && pacman -S git firefox geckodriver python --needed --noconfirm \
    && pacman -Rs --noconfirm git \
    && echo -e "y\nY" | pacman -Scc

COPY run.sh run.sh
COPY arkose.html arkose.html

CMD ["/bin/bash", "/run.sh"]
