# How to build fadecut for debian

## Prepare build environment

	apt-get -t testing install dh-make fakeroot devscripts \
	  debian-policy gnu-standards developers-reference
	  build-essential libdpkg-perl git-buildpackage quilt \
	  lintian piuparts

	cat << EOF >>~/.bashrc
	DEBEMAIL=your@email.ch
	DEBFULLNAME="Firstname Lastname"
	export DEBEMAIL DEBFULLNAME
	EOF

## Get fadecut source from github

	cd ~/
	git clone https://github.com/fadecut/fadecut.git
	cd fadecut

## Build an upstream release

	git checkout debian
	git archive --format=tar --prefix=fadecut-0.1.5/ master | gzip > ../fadecut_0.1.5.orig.tar.gz
	debuild -us -uc --lintian-opts -i -v -I --pedantic

If you get this error, please install depending packages:

	dpkg-checkbuilddeps: Fehler: Unmet build dependencies: vorbis-tools opus-tools lame sox libsox-fmt-mp3 streamripper id3v2 pandoc (>= 1.12)

	apt-get install vorbis-tools opus-tools lame sox libsox-fmt-mp3 streamripper id3v2 pandoc

## Build a prior release

	git checkout debian/0.1.4-1
	git archive --format=tar --prefix=fadecut-0.1.4/ 0.1.4 | gzip > ../fadecut_0.1.4.orig.tar.gz
	debuild -us -uc --lintian-opts -i -v -I --pedantic

## Install new fadecut package

	dpkg -i ../fadecut_*.deb
