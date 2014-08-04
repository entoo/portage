# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libuv/libuv-0.11.22.ebuild,v 1.2 2014/04/08 12:54:17 hasufell Exp $

EAPI=5

inherit eutils autotools

DESCRIPTION="A new platform layer for Node"
HOMEPAGE="https://github.com/joyent/libuv"
SRC_URI="https://github.com/joyent/libuv/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD BSD-2 ISC MIT"
SLOT="0/11"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static-libs"

DEPEND="virtual/pkgconfig"

src_prepare() {
	echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])" \
    	> m4/libuv-extra-automake-flags.m4 || die

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static)
}

src_install() {
	default
	prune_libtool_files
}
