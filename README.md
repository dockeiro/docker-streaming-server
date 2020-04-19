[![Circle CI](https://circleci.com/gh/dockeirorock/docker-streaming-server.svg?style=shield "CircleCI")](https://circleci.com/gh/dockeirorock/docker-streaming-server)&nbsp;[![Size](https://images.microbadger.com/badges/image/dockeirorock/streaming-server.svg)](http://microbadger.com/images/dockeirorock/streaming-server)&nbsp;[![Version](https://images.microbadger.com/badges/version/dockeirorock/streaming-server.svg)](http://microbadger.com/images/dockeirorock/streaming-server)&nbsp;[![Commit](https://images.microbadger.com/badges/commit/dockeirorock/streaming-server.svg)](http://microbadger.com/images/dockeirorock/streaming-server)&nbsp;[![Docker Hub](https://img.shields.io/docker/pulls/dockeirorock/streaming-server.svg)](https://hub.docker.com/r/dockeirorock/streaming-server/)

Docker Streaming Server
=======================

A robust way of streaming media content live using the [NGINX](https://nginx.org/) web server and its [RTMP](https://github.com/tiangolo/nginx-rtmp-docker) module.

Installation
------------

Builds of the image are available on [Docker Hub](https://hub.docker.com/r/dockeirorock/streaming-server/).

```sh
docker pull dockeirorock/streaming-server
```

Alternatively you can build the image yourself.

```sh
git clone https://github.com/dockeiro/docker-streaming-server.git && \
cd docker-streaming-server && \
ARCH=$(dpkg --print-architecture) && \
echo ARCH loaded: ${ARCH} && \
docker build --no-cache \
--build-arg IMAGE=dockeirorock/streaming-server \
--build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
--build-arg VERSION=$(cat VERSION) \
--build-arg VCS_REF=$(git rev-parse --short HEAD) \
--build-arg VCS_URL=$(git config --get remote.origin.url) \
--tag dockeirorock/streaming-server:$(cat VERSION)-${ARCH} \
--rm .
```

Quickstart
----------

Start container using:

```sh
docker run --detach --restart always \
    --name streaming-server \
    --hostname streaming-server \
    --publish 1935:1935 \
    --publish 8080:8080 \
    --publish 8443:8443 \
    dockeirorock/streaming-server
```

Example
-------

1. Start the streaming server and consumer from the command line

    ```bash
    cd ./documents/examples
    docker-compose up -d
    ```

2. Use [Open Broadcaster Software](https://obsproject.com/) to stream your content

    * Add media source `Sources` > `+` > `Video Capture Device`
    * Configure streaming server `Controls` > `Settings` > `Stream`
        * Stream type: `Custom Streaming Server`
        * URL: `rtmp://localhost/live`
        * Stream key: `test`
    * Press `Start Streaming` button

3. Go to `http://localhost:9999` URL address in your browser to view the media live.

See
---

* [Open Broadcaster Software post](https://obsproject.com/forum/resources/how-to-set-up-your-own-private-streaming-server-server-using-nginx.50/)
