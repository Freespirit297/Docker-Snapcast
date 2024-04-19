ARG  CODE_VERSION=edge
FROM alpine:${CODE_VERSION}

LABEL maintainer="Freespirit290712"

# SET enviremental options. e -> Exit on error, x -> Print arguments.
RUN set -ex

RUN echo "---- Add testing repository ----"
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN echo "---- Install packages ----"
RUN apk add --no-cache -U --upgrade \
    librespot \
    snapcast

RUN echo "---- Cleanup ----"
RUN rm -rf /tmp/*

# Ports
EXPOSE 1704
EXPOSE 1780