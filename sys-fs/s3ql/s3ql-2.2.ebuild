# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/s3ql/s3ql-2.2.ebuild,v 1.1 2013/07/14 01:20:46 radhermit Exp $

EAPI=5
PYTHON_COMPAT=( python3_3 )

inherit distutils-r1

DESCRIPTION="A full-featured file system for online data storage"
HOMEPAGE="http://code.google.com/p/s3ql/"
SRC_URI="http://s3ql.googlecode.com/files/${P/_/-}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="contrib doc test"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/apsw-3.7.0[${PYTHON_USEDEP}]
	>=dev-python/llfuse-0.39[${PYTHON_USEDEP}]
	dev-python/pycrypto[${PYTHON_USEDEP}]
	sys-fs/fuse"
DEPEND="${RDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		net-misc/rsync[xattr]
	)"

python_test() {
	if [[ ${EUID} -ne 0 ]] ; then
		ewarn "Skipping tests: root privileges are required so userpriv must be disabled"
	else
		addwrite /dev/fuse
		esetup.py test
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	if use contrib ; then
		exeinto /usr/share/doc/${PF}/contrib
		docompress -x /usr/share/doc/${PF}/contrib
		doexe contrib/*.{py,sh}
		doman contrib/*.1
	fi

	if use doc ; then
		dodoc doc/manual.pdf
		dohtml -r doc/html/*
	fi
}
