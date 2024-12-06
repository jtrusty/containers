FROM docker.io/library/alpine:3.21

ARG VERSION
ARG TARGETPLATFORM
ARG CHANNEL

USER root
WORKDIR /app

#hadolint ignore=DL3018
RUN apk update && \
    apk add --no-cache \
    # build/code
    coreutils build-base bash bash-completion vim jq \
    # network
    bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools bridge-utils iperf \
    # certificates
    ca-certificates openssl \
    # init system
    catatonit \
    # database clients
    postgresql-client mysql-client

ENTRYPOINT ["/usr/bin/catatonit", "--"]

CMD ["tail", "-f", "/dev/null"]