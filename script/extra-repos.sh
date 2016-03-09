#!/bin/bash -eux

: ${EL_VERSION:=$(rpm -E %centos)}
: ${RPMFUSION_PKG_VERSION:=1}
: ${ARCH:=$(uname -i)}

echo "==> Installing additional repositories"
yum -y install epel-release
yum -y localinstall --nogpgcheck \
	http://download1.rpmfusion.org/free/el/updates/${EL_VERSION}/${ARCH}/rpmfusion-free-release-${EL_VERSION}-${PKG_VERSION}.noarch.rpm \
	http://download1.rpmfusion.org/nonfree/el/updates/${EL_VERSION}/${ARCH}/rpmfusion-nonfree-release-${EL_VERSION}-${PKG_VERSION}.noarch.rpm \
	http://mirror.symnds.com/distributions/gf/el/${EL_VERSION}/gf/${ARCH}/gf-release-${EL_VERSION}-8.gf.el${EL_VERSION}.noarch.rpm \
	http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el${EL_VERSION}.rf.${ARCH}.rpm \
	http://dl.atrpms.net/all/atrpms-repo-${EL_VERSION}-7.el${EL_VERSION}.${ARCH}.rpm
	
