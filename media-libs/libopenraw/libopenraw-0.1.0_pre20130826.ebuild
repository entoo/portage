# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libopenraw/libopenraw-0.1.0_pre20130826.ebuild,v 1.2 2013/09/10 14:28:37 ssuominen Exp $

EAPI=5

inherit eutils gnome2-utils

DESCRIPTION="A decoding library for RAW image formats"
HOMEPAGE="http://libopenraw.freedesktop.org/wiki/"
SRC_URI="http://dev.gentoo.org/~eva/distfiles/${PN}/${P}.tar.bz2
	http://${PN}.freedesktop.org/download/${P}.tar.bz2"

LICENSE="GPL-3 LGPL-3"
SLOT="0/7"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x64-macos ~x86-solaris"
IUSE="gtk static-libs test"

RDEPEND="
	dev-libs/libxml2
	virtual/jpeg:0
	gtk? (
		>=dev-libs/glib-2
		>=x11-libs/gdk-pixbuf-2.24.0:2 )
"
DEPEND="${RDEPEND}
	>=dev-libs/boost-1.35
	virtual/pkgconfig
	test? ( net-misc/curl )
"

S="${WORKDIR}/${PN}-0.1.0"

DOCS=( AUTHORS ChangeLog NEWS README TODO )

src_configure() {
	econf \
		--with-boost="${EPREFIX}"/usr \
		$(use_enable static-libs static) \
		$(use_enable gtk gnome)
}

src_install() {
	default
	prune_libtool_files --modules
}

pkg_preinst() {
	gnome2_gdk_pixbuf_savelist
}

pkg_postinst() {
	gnome2_gdk_pixbuf_update
}

pkg_postinst() {
	gnome2_gdk_pixbuf_update
}
