# How to build a fadecut debian package

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

## Get source from github

	cd ~/
	git clone https://github.com/fadecut/fadecut.git

## Greate tar archive from source

	cd fadecut
	git checkout debian
	git archive --format=tar --prefix=fadecut-0.X.X/ 0.X.X | gzip > ../fadecut_0.X.X.orig.tar.gz

# Install build dependencies

	apt-get install vorbis-tools opus-tools lame sox libsox-fmt-mp3 \
	streamripper id3v2 pandoc

## Build debian package

	debuild -us -uc --lintian-opts -i -v -I --pedantic
	dpkg -i ../fadecut_*.deb
