FROM debian:buster

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq make dpkg-dev debhelper lintian && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
