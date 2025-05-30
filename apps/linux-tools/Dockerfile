FROM docker.io/library/alpine:3.22

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
    bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools bridge-utils iperf3 busybox-extras \
    # certificates
    ca-certificates openssl \
    # nfs
    nfs-utils rpcbind\
    # init system
    catatonit \
    # database clients
    postgresql-client mysql-client

ENTRYPOINT ["/usr/bin/catatonit", "--"]

CMD ["tail", "-f", "/dev/null"]