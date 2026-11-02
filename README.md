# caddy-docker-proxy

Customize caddy-docker-proxy with Cloudflare, Hetzner DNS and TPC Layer 4.

## Images and releases

The daily GitHub Actions workflow checks the latest Caddy release. When it changes, it updates `CADDY_VERSION` in the Dockerfile, commits the update, and creates a matching `v<version>` tag. The workflow publishes Docker images and cross-platform binaries to GitHub Releases. It can also be started manually from the Actions tab.

The `latest`, `<version>`, and `docker-proxy` images contain Caddy with the caddy-docker-proxy plugin. The `cloudflare`, `hetzner`, and `layer4` images add the named plugin to that base, while `all` includes all four plugins. Each variant is also published with a versioned tag such as `<version>-cloudflare`. All variants start with the `docker-proxy` command.

Manual runs can select one of the built-in variants, or choose `custom` to add comma-separated Go module paths to the caddy-docker-proxy base in `custom_plugins`, for example `github.com/example/caddy-module@v1.0.0`. Custom variants are published with run-specific tags and their binaries are attached to the Caddy version's GitHub Release.

Release binaries are built for Linux (amd64, arm64, armv7, 386), macOS (amd64, arm64), Windows (amd64, arm64, 386), and FreeBSD (amd64, arm64), for each selected plugin variant.

Refs:
- [lucaslorentz/caddy-docker-proxy](https://github.com/lucaslorentz/caddy-docker-proxy)
- [caddyserver/caddy](https://github.com/caddyserver/caddy)
- [caddy-dns/cloudflare](https://github.com/caddy-dns/cloudflare)
- [caddy-dns/hetzner](https://github.com/caddy-dns/hetzner)
- [caddy-l4](https://github.com/mholt/caddy-l4)
