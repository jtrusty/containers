FROM docker.io/library/alpine:3.20

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

LABEL org.opencontainers.image.source="https://github.com/mylar3/mylar3"

ENV UMASK="0002" \
    TZ="Etc/UTC"

USER root
WORKDIR /app

#hadolint ignore=DL3018,DL3059
RUN \
    echo "**** install build dependencies ****" \
    && apk add --no-cache --virtual=build-dependencies \
        build-base \
        jpeg-dev \
        libffi-dev \
        libwebp-dev \
        python3-dev \
        zlib-dev \
    && echo "**** install runtime packages ****" \
    && apk add --no-cache \
        bash \
        catatonit \
        coreutils \
        curl \
        jpeg \
        libwebp-tools \
        nodejs \
        py3-pip \
        python3 \
        zlib

RUN \
    case "${TARGETPLATFORM}" in \
        'linux/amd64') \
            export ARCH='amd64'; \
        ;; \
        'linux/arm64') \
            export ARCH='arm64'; \
        ;; \
    esac
    
RUN \
    echo "**** install mylar3 ****" \
    && mkdir -p /app/mylar3 \
    && curl -fsSL "https://github.com/mylar3/mylar3/archive/v${VERSION}.tar.gz" \
        | tar xzf - -C /app/mylar3 --strip-components=1 \
    && cd /app/mylar3 \
    && python3 -m venv venv \
    && . venv/bin/activate \
    && pip install -U --no-cache-dir \
        pip \
        wheel \
    && pip install --no-cache-dir -r requirements.txt

RUN \
    echo "**** cleanup ****" \
    && apk del --purge \
    && rm -rf \
        /root/.cache \
        /tmp/*

COPY ./apps/mylar3/entrypoint.sh /entrypoint.sh

USER nobody:nogroup

WORKDIR /config/mylar3
VOLUME ["/config"]

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]