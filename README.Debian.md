# How to build fadecut for debian (in a docker environment)

## Prepare

1st prepare your shell environment:

	cat << EOF >>~/.bashrc
	DEBEMAIL=your@email.ch
	DEBFULLNAME="Firstname Lastname"
	export DEBEMAIL DEBFULLNAME


Install docker on your host system:

	apt-get -t jessie-backports install docker.io

If you want to use docker with your non-root user:

	groupadd docker
	usermod -a -G docker youruser
	reboot

Now you can build the docker image with debian testing:

	docker build -t debian-testing .

Get fadecut source from github:

	cd ~/src
	git clone https://github.com/fadecut/fadecut.git
	cd fadecut
	git checkout debian

## Build the package inside the docker image

Login into docker image and map your fadecut source dir into the image:

	docker run -v /home/hostuser/:/home/user -ti debian-testing

From now you have a shell like this `user@xyz:~/$` until you type `exit`:

	user@xyz:~/$ cd ~/src/fadecut
	git archive --format=tar --prefix=fadecut-0.2.0/ master | gzip > ../fadecut_0.2.0.orig.tar.gz
	debuild -us -uc --lintian-opts -i -v -I --pedantic

## Build a prior release

	git checkout debian/0.1.4-1
	git archive --format=tar --prefix=fadecut-0.1.4/ 0.1.4 | gzip > ../fadecut_0.1.4.orig.tar.gz
	debuild -us -uc --lintian-opts -i -v -I --pedantic

## Install new fadecut package

	dpkg -i ../fadecut_*.deb
