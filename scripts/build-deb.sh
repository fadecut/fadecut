#!/bin/bash

# aptitude install dh-make fakeroot devscripts debian-policy gnu-standards developers-reference build-essential 

REVISION=fadecut-0.1.1
TMPDIR=/tmp

echo "generate tar package ----------------------------------------------------"
rm -rf fadecut_* fadecut-*
git archive --format=tar --prefix=${REVISION}/ HEAD | gzip \
       >${TMPDIR}/${REVISION}.tgz
tar fz ${TMPDIR}/${REVISION}.tgz --list
cp ${TMPDIR}/${REVISION}.tgz .
tar xfz ${TMPDIR}/${REVISION}.tgz
cd ${REVISION}
dh_make -f ../${REVISION}.tgz
cp -rp ../debian/* ./debian
echo "dpkg-buildpackage  ------------------------------------------------------"
dpkg-buildpackage -rfakeroot
# check package
echo "lintian -----------------------------------------------------------------"
lintian -i ../fadecut_*.deb | grep -v N:

echo "dpkg --contents ---------------------------------------------------------"
dpkg --contents ../fadecut_*.deb
