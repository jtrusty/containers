ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

FROM pihole/pihole:${VERSION}

RUN \
    apk add --no-cache \
    unbound

COPY ./apps/pi-hole-unbound/lighttpd-external.conf /etc/lighttpd/external.conf 
COPY ./apps/pi-hole-unbound/unbound-pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY ./apps/pi-hole-unbound/99-edns.conf /etc/dnsmasq.d/99-edns.conf

RUN mkdir -p /etc/services.d/unbound

COPY ./apps/pi-hole-unbound/unbound-run /etc/services.d/unbound/run

# Create the script to download root hints
COPY ./apps/pi-hole-unbound/update-root-hints.sh /usr/local/bin/update-root-hints.sh
RUN chmod +x /usr/local/bin/update-root-hints.sh

# Set up the cron job
RUN echo "0 0 1 */6 * /usr/local/bin/update-root-hints.sh" >> /etc/crontabs/root

# Start crond and Pi-hole
CMD ["sh", "-c", "crond && /start.sh"]

LABEL org.opencontainers.image.source="https://github.com/pi-hole/pi-hole"