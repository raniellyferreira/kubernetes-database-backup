FROM alpine:3

LABEL maintainer="Ranielly Ferreira <eu@raniellyferreira.com.br>"

RUN set -xe; \
    apk add --no-cache --update \
    bash \
    tzdata \
    curl \
    zip \
    tar \
    mongodb-tools \
    mariadb-client \
    python3 \
    py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install awscli rotate-backups-s3

COPY scripts/start-backups /usr/local/bin/start-backups
RUN chmod +x /usr/local/bin/start-backups

COPY scripts/mongodb-backup /usr/local/bin/mongodb-backup
RUN chmod +x /usr/local/bin/mongodb-backup

COPY scripts/mysql-backup /usr/local/bin/mysql-backup
RUN chmod +x /usr/local/bin/mysql-backup

WORKDIR /backup

ENTRYPOINT [ "start-backups" ]
