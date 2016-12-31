# Run fadecut build environment in a docker container

# Build this docker image:
# docker build -t fadecut .

# Run this docker image:
# docker run -ti fadecut

FROM debian:testing
MAINTAINER Marco Balmer <marco@balmer.name>
ENV DEBIAN_FRONTEND noninteractive

RUN addgroup --gid 1000 user \
        && useradd -d /home/user -g user user

# build environment
RUN apt-get update && apt-get install -y \
        ca-certificates \
	dh-make \
	fakeroot \
	devscripts \
	debian-policy \
	gnu-standards \
        gnupg2 \
        gnupg-agent \
	developers-reference \
	build-essential \
	openssh-client \
        less \
        locales-all \
	libdpkg-perl \
	git-buildpackage \
	quilt \
	lintian \
	piuparts \
	man \
	vim

# special for build the package
RUN apt-get update && apt-get install -y \
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
# a browser is necessary!
ENV BROWSER lynx
# set locale
ENV LANG de_CH.UTF-8

CMD ["bash"]
