FROM alpine:3

LABEL maintainer="Ranielly Ferreira <eu@raniellyferreira.com.br>"

RUN set -ex; \
    apk add --no-cache --update \
        bash \
        tzdata \
        curl \
        zip \
        tar \
        mongodb-tools \
        mariadb-client \
        mariadb-connector-c-dev \
        aws-cli \
        openssl

RUN set -ex; \
    curl -SsL https://raw.githubusercontent.com/raniellyferreira/rotate-files/master/environment/scripts/get | sh

WORKDIR /backup

ENV PATH "$PATH:/opt/scripts/bin"

COPY scripts/ /opt/scripts/bin/

RUN chmod +x /opt/scripts/bin/*

ENTRYPOINT [ "start-backups" ]
