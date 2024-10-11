ARG VERSION

FROM docker.io/library/alpine:${VERSION}

ARG TARGETPLATFORM
ARG CHANNEL

USER root
WORKDIR /app

#hadolint ignore=DL3018
RUN apk update && \
    apk add --no-cache \
    # build/code
    build-base bash bash-completion vim jq \
    # network
    bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools bridge-utils iperf \
    # certificates
    ca-certificates openssl

ENTRYPOINT ["/usr/bin/catatonit", "--"]