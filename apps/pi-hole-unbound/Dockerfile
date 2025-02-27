ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

FROM pihole/pihole:${VERSION}

RUN \
    apk add --no-cache \
    unbound

COPY ./apps/pihole-unbound/lighttpd-external.conf /etc/lighttpd/external.conf 
COPY ./apps/pihole-unbound/unbound-pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY ./apps/pihole-unbound/99-edns.conf /etc/dnsmasq.d/99-edns.conf

RUN mkdir -p /etc/services.d/unbound

COPY ./apps/pi-hole-unbound/unbound-run /etc/services.d/unbound/run

ENTRYPOINT ./s6-init

LABEL org.opencontainers.image.source="https://github.com/pi-hole/pi-hole-docker"