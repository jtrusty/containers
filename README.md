<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/README.md.j2
-->
<div align="center">


## Containers

This has been heavily inspired by: https://github.com/onedr0p/containers

_An opinionated collection of container images for my personal use_

</div>

Welcome to my container images, if looking for a container start by [browsing the GitHub Packages page for this repo's packages](https://github.com/jtrusty?tab=packages&repo_name=containers).

## Mission statement

The goal of this project is to support [semantically versioned](https://semver.org/), [rootless](https://rootlesscontaine.rs/) containers for various applications.

It also adheres to a [KISS principle](https://en.wikipedia.org/wiki/KISS_principle), logging to stdout, [one process per container](https://testdriven.io/tips/59de3279-4a2d-4556-9cd0-b444249ed31e/), no [s6-overlay](https://github.com/just-containers/s6-overlay) and all images are built on top of [Alpine](https://hub.docker.com/_/alpine) or [Ubuntu](https://hub.docker.com/_/ubuntu).

## Tag immutability

The containers built here do not use immutable tags, as least not in the more common way you have seen from [linuxserver.io](https://fleet.linuxserver.io/) or [Bitnami](https://bitnami.com/stacks/containers).

We do take a similar approach but instead of appending a `-ls69` or `-r420` prefix to the tag we instead insist on pinning to the sha256 digest of the image, while this is not as pretty it is just as functional in making the images immutable.

| Container                                          | Immutable |
|----------------------------------------------------|-----------|
| `ghcr.io/jtrusty/plex:rolling`                      | ❌        |
| `ghcr.io/jtrusty/plex:1.41.0`                      | ❌        |
| `ghcr.io/jtrusty/plex:rolling@sha256:e7c0...`       | ✅        |
| `ghcr.io/jtrusty/plex:1.41.0@sha256:e7c0...`       | ✅        |

_If pinning an image to the sha256 digest, tools like [Renovate](https://github.com/renovatebot/renovate) support updating the container on a digest or application version change._

## Rootless

To run these containers as non-root make sure you update your configuration to the user and group you want.

### Docker compose

```yaml
services:
  plex:
    image: ghcr.io/jtrusty/plex:1.41.0@sha256:e7c0...
    container_name: plex
    user: 65534:65534  # nobody
    # ...
```

### Kubernetes

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: plex
# ...
spec:
  # ...
  template:
    # ...
    spec:
      # ...
      securityContext:
        runAsUser: 65534 # nobody
        runAsGroup: 65534 # nobody
        fsGroup: 65534 # nobody
        fsGroupChangePolicy: OnRootMismatch
# ...
```

## Passing arguments to a application

Some applications do not support defining configuration via environment variables and instead only allow certain config to be set in the command line arguments for the app. To circumvent this, for applications that have an `entrypoint.sh` read below.

1. First read the Kubernetes docs on [defining command and arguments for a Container](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/).
2. Look up the documentation for the application and find a argument you would like to set.
3. Set the argument in the `args` section, be sure to include `entrypoint.sh` as the first arg and any application specific arguments thereafter.

    ```yaml
    args:
      - /entrypoint.sh
      - --port
      - "8080"
    ```

## Configuration volume

For applications that need to have persistent configuration data the config volume is hardcoded to `/config` inside the container. This is not able to be changed in most cases.

## Available Images

Each Image will be built with a `rolling` tag, along with tags specific to it's version. Available Images Below

Container | Channel | Image
--- | --- | ---
[actions-runner](https://github.com/jtrusty/containers/pkgs/container/actions-runner) | stable | ghcr.io/jtrusty/actions-runner
[bazarr](https://github.com/jtrusty/containers/pkgs/container/bazarr) | stable | ghcr.io/jtrusty/bazarr
[it-tools](https://github.com/jtrusty/containers/pkgs/container/it-tools) | stable | ghcr.io/jtrusty/it-tools
[lidarr](https://github.com/jtrusty/containers/pkgs/container/lidarr) | master | ghcr.io/jtrusty/lidarr
[lidarr-develop](https://github.com/jtrusty/containers/pkgs/container/lidarr-develop) | develop | ghcr.io/jtrusty/lidarr-develop
[linux-tools](https://github.com/jtrusty/containers/pkgs/container/linux-tools) | stable | ghcr.io/jtrusty/linux-tools
[mylar3](https://github.com/jtrusty/containers/pkgs/container/mylar3) | master | ghcr.io/jtrusty/mylar3
[plex](https://github.com/jtrusty/containers/pkgs/container/plex) | stable | ghcr.io/jtrusty/plex
[plex-beta](https://github.com/jtrusty/containers/pkgs/container/plex-beta) | beta | ghcr.io/jtrusty/plex-beta
[postgres-init](https://github.com/jtrusty/containers/pkgs/container/postgres-init) | stable | ghcr.io/jtrusty/postgres-init
[prowlarr](https://github.com/jtrusty/containers/pkgs/container/prowlarr) | master | ghcr.io/jtrusty/prowlarr
[prowlarr-develop](https://github.com/jtrusty/containers/pkgs/container/prowlarr-develop) | develop | ghcr.io/jtrusty/prowlarr-develop
[radarr](https://github.com/jtrusty/containers/pkgs/container/radarr) | master | ghcr.io/jtrusty/radarr
[radarr-develop](https://github.com/jtrusty/containers/pkgs/container/radarr-develop) | develop | ghcr.io/jtrusty/radarr-develop
[readarr-develop](https://github.com/jtrusty/containers/pkgs/container/readarr-develop) | develop | ghcr.io/jtrusty/readarr-develop
[sonarr](https://github.com/jtrusty/containers/pkgs/container/sonarr) | main | ghcr.io/jtrusty/sonarr
[sonarr-develop](https://github.com/jtrusty/containers/pkgs/container/sonarr-develop) | develop | ghcr.io/jtrusty/sonarr-develop
[tautulli](https://github.com/jtrusty/containers/pkgs/container/tautulli) | stable | ghcr.io/jtrusty/tautulli


## Deprecations

Containers here can be **deprecated** at any point, this could be for any reason described below.

1. The upstream application is **no longer actively developed**
2. The upstream application has an **official upstream container** that follows closely to the mission statement described here
3. The upstream application has been **replaced with a better alternative**
4. The **maintenance burden** of keeping the container here **is too bothersome**

**Note**: Deprecated containers will remained published to this repo for 6 months after which they will be pruned.

## Credits

- A lot of inspiration and ideas are thanks to the hard work of [hotio.dev](https://hotio.dev/) and [linuxserver.io](https://www.linuxserver.io/) contributors.
- Credit to @onedr0p for building all of the automation and workflows to publish and build containers. Thank you.