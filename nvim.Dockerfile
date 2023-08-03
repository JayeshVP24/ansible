FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS jay 
ARG TAGS
RUN addgroup --gid 1000 jayesh
RUN adduser --gecos jayesh --uid 1000 --gid 1000 --disabled-password jayesh
USER jayesh
WORKDIR /home/jayesh

FROM jay 
COPY . .

