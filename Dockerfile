## Using focal (LTS) instead of latest to prevent accidental upgrade to jammy before everything else is ready. ##
ARG FRM='ubuntu:jammy'
ARG TAG='latest'
ARG DEBIAN_FRONTEND='noninteractive'

FROM ${FRM}
ARG FRM
ARG TAG

## build note ##
RUN echo "$(date "+%d.%m.%Y %T") Built from ${FRM}" >> /build.info

## Install basic packages ##
RUN apt -y update \
    && apt -y upgrade \
    && apt -y dist-upgrade \
    && apt -y install bash nano procps tini \
    && apt -y install curl unzip jq \
    && apt -y install tar \
    && apt -y remove hddtemp \
    && apt -y autoremove \
    && apt -y autoclean \
    && apt -y clean \
    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*
