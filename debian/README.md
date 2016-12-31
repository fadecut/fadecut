# How to build fadecut for debian (in a docker environment)

## Install docker

	apt-get -t jessie-backports install docker.io

If you want to use docker with your non-root user:

	groupadd docker
	usermod -a -G docker youruser
	reboot

## Build docker image of jessie:testing

Now you can build the docker image with debian testing in it:

	docker build -t testing .

## Prepare fadecut source

	cd ~/src
	git clone https://github.com/fadecut/fadecut.git
	git checkout debian

If success, login into your new testing image:

	docker run -ti testing

## Inside docker image

Login into docker image and map your fadecut source dir into the image:

	docker run -v /home/hostuser/src/:/home/user/src/ -ti testing

From now you have a shell like this `user@xyz:~/$` until you type `exit`:
	user@xyz:~/$ cd
	cd src/fadecut
	git archive --format=tar --prefix=fadecut-0.2.0/ master | gzip > ../fadecut_0.2.0.orig.tar.gz
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
