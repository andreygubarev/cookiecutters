# syntax=docker/dockerfile:1
FROM debian:bookworm-slim
LABEL org.opencontainers.image.title="{{ cookiecutter.name }}"
LABEL org.opencontainers.image.description="{{ cookiecutter.description }}"
LABEL org.opencontainers.image.authors="{{ cookiecutter.author }}"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        tini \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
