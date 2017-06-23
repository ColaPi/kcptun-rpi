FROM hypriot/rpi-alpine:3.5

MAINTAINER cola <colachg@gmail.com>

ARG KCP_VER=20170525
ARG KCP_URL=https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-arm-$KCP_VER.tar.gz

RUN set -ex &&\
    apk add --update --no-cache --virtual .build curl &&\
    curl -sSL $KCP_URL | tar xz -C /usr/local/bin/ client_linux_arm7 &&\
    apk del --purge .build &&\
    rm -rf /var/cache/* /tmp/*

WORKDIR /kcptun

EXPOSE 2000/udp

ENTRYPOINT ["/usr/local/bin/client_linux_arm7"]

CMD ["-c", "kcptun.json"]
