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

RUN mkdir -p /etc/services.d/unbound

COPY ./apps/pi-hole-unbound/resources/unbound-run /etc/services.d/unbound/run

# Create the script to download root hints
COPY ./apps/pi-hole-unbound/resources/update-root-hints.sh /usr/local/bin/update-root-hints.sh

# Set up the cron job
RUN echo "0 0 1 */6 * /usr/local/bin/update-root-hints.sh" >> /etc/crontabs/root

# Copy the startup script
COPY ./apps/pi-hole-unbound/entrypoint.sh /usr/local/bin/entrypoint.sh

# Start crond, unbound, and Pi-hole
CMD ["/usr/local/bin/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/pi-hole/pi-hole"