#!/bin/bash

# aptitude install dh-make fakeroot devscripts debian-policy gnu-standards developers-reference build-essential 

REVISION=fadecut-0.1.1
WORKDIR=`pwd`
TMPDIR=/tmp

echo "generate tar package ----------------------------------------------------"
rm -rf ${TMPDIR}/fadecut_* ${TMPDIR}/fadecut-*
git archive --format=tar --prefix=${REVISION}/ HEAD | gzip \
       >${TMPDIR}/${REVISION}.tgz
tar fz ${TMPDIR}/${REVISION}.tgz --list
cd ${TMPDIR}
tar xfz ${REVISION}.tgz
cd ${REVISION}
dh_make -f ../${REVISION}.tgz
cd ${WORKDIR}
echo "copy our scripts for generating deb package -----------------------------"
cp -rp ./scripts/debian/* ${TMPDIR}/${REVISION}/debian
rm ${TMPDIR}/${REVISION}/debian/README.Debian
echo "dpkg-buildpackage  ------------------------------------------------------"
cd ${TMPDIR}/${REVISION}
dpkg-buildpackage -rfakeroot
# check package
echo "lintian -----------------------------------------------------------------"
lintian -i ../fadecut_*.deb | grep -v N:

echo "dpkg --contents ---------------------------------------------------------"
dpkg --contents ../fadecut_*.deb
