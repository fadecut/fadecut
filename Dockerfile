# This is a debian build environment in a docker container.
# Have a look into README.Debian.md how to use it.

# Build this docker image:
# docker build -t debuild-fadecut .

# Run this docker image:
# docker run -v ${HOME}:/home/user/ -ti debuild-fadecut

FROM debian:testing
MAINTAINER Marco Balmer <marco@balmer.name>
ENV DEBIAN_FRONTEND noninteractive

RUN addgroup --gid 1000 user \
        && useradd -d /home/user -g user user

# apt environment & upgrade
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    apt-utils

# build environment
RUN apt-get update && apt-get install -y \
    build-essential \
    cme \
    git \
    ca-certificates \
    dh-make \
    fakeroot \
    devscripts \
    debian-policy \
    gnu-standards \
    gnupg2 \
    gnupg-agent \
    developers-reference \
    openssh-client \
    less \
    locales-all \
    libdpkg-perl \
    git-buildpackage \
    quilt \
    lintian \
    piuparts \
    man

# special for build the package
RUN apt-get update && apt-get install -y \
    vim \
    vorbis-tools \
    opus-tools \
    lame \
    sox \
    libsox-fmt-mp3 \
    streamripper \
    id3v2 \
    pandoc \
    mediainfo

USER user
ENV HOME /home/user
ENV TERM xterm-256color
# set locale
ENV LANG de_CH.UTF-8

CMD ["bash"]
