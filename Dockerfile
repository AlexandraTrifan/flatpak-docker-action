FROM ubuntu:18.04

RUN apt-get update -y

# Install base dependencies
RUN apt-get install -y software-properties-common build-essential git sudo apt-utils

# Install flatpak
RUN add-apt-repository ppa:alexlarsson/flatpak -y
RUN apt-get update -y
RUN apt install flatpak flatpak-builder -y

# Install remote
RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
RUN flatpak install flathub org.kde.Platform//5.12 -y
RUN flatpak install flathub org.kde.Sdk//5.12 -y

ARG REPO_LINK=https://github.com/analogdevicesinc/scopy-flatpak
ARG REPO_LOCAL=/home/docker/scopy-flatpak
ARG REPO_BRANCH=master

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

