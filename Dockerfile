FROM alpine:3.16

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
        postgresql-client \
        aws-cli \
        openssl

RUN set -ex; \
    curl -SsL https://raw.githubusercontent.com/raniellyferreira/rotate-files/master/environment/scripts/get | bash

WORKDIR /backup

ENV PATH "$PATH:/opt/scripts/bin"

# Keep for compatibility with old versions
COPY charts/database-backup/scripts/ /opt/scripts/bin/
RUN chmod +x /opt/scripts/bin/*

CMD [ "start-backups" ]
