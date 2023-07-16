FROM archlinux

ENV PLAYWRIGHT_NODEJS_PATH=/usr/bin/node
ENV MIRROR_URL 'https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch'

RUN echo "Server = ${MIRROR_URL}" > /etc/pacman.d/mirrorlist \
    && pacman -Sy --needed --noconfirm \
    && pacman -S git go nodejs firefox --needed --noconfirm \
    && git clone https://github.com/linweiyuan/chatgpt-arkose-token-api \
    && cd chatgpt-arkose-token-api \
    && go build -ldflags="-w -s" -o chatgpt-arkose-token-api main.go \
    && pacman -Rs --noconfirm go git \
    && rm -rf /root/go \
    && echo -e "y\nY" | pacman -Scc

COPY run.sh run.sh

CMD ["/bin/bash", "/run.sh"]
