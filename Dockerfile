ARG CADDY_VERSION=2.11.7
FROM caddy:${CADDY_VERSION}-builder AS builder
ARG CADDY_PLUGINS=github.com/lucaslorentz/caddy-docker-proxy/v2

RUN set -eu; \
    set --; \
    old_ifs="$IFS"; IFS=','; \
    for plugin in $CADDY_PLUGINS; do \
        [ -z "$plugin" ] || set -- "$@" --with "$plugin"; \
    done; \
    IFS="$old_ifs"; \
    xcaddy build "$CADDY_VERSION" "$@"

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
