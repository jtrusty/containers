ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

FROM pihole/pihole:${VERSION}

RUN \
    apk add --no-cache \
    unbound

COPY ./apps/pi-hole-unbound/resources/lighttpd-external.conf /etc/lighttpd/external.conf 
COPY ./apps/pi-hole-unbound/resources/unbound-pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY ./apps/pi-hole-unbound/resources/99-edns.conf /etc/dnsmasq.d/99-edns.conf

# Create the script to download root hints
COPY ./apps/pi-hole-unbound/resources/update-root-hints.sh /update-root-hints.sh

# Update the start.sh script with our modified version for unbound
COPY ./apps/pi-hole-unbound/resources/start.sh /usr/bin/start.sh

# Set up the cron job
RUN echo "0 0 1 */6 * /update-root-hints.sh" >> /crontab.txt

LABEL org.opencontainers.image.source="https://github.com/pi-hole/pi-hole"