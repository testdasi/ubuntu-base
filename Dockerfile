# Using focal (LTS) instead of latest to prevent accidental upgrade to jammy before everything else is ready.
ARG FRM='ubuntu:focal'
ARG TAG='latest'

FROM ${FRM}
ARG FRM
ARG TAG

# Install basic packages
RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y dist-upgrade \
    && apt-get -y install bash nano procps tini \
    && apt-get -y install curl unzip jq \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && apt-get -y clean \
    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*

RUN echo "$(date "+%d.%m.%Y %T") Built from ${FRM} with tag ${TAG}" >> /build_date.info
