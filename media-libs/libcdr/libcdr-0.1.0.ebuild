# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libcdr/libcdr-0.1.0.ebuild,v 1.1 2014/09/14 08:48:56 dilfridge Exp $

EAPI=5

EGIT_REPO_URI="git://anongit.freedesktop.org/git/libreoffice/libcdr/"
inherit base eutils
[[ ${PV} == 9999 ]] && inherit autotools git-2

DESCRIPTION="Library parsing the Corel cdr documents"
HOMEPAGE="https://wiki.documentfoundation.org/DLP/Libraries/libcdr"
[[ ${PV} == 9999 ]] || SRC_URI="http://dev-www.libreoffice.org/src/${PN}/${P}.tar.xz"

LICENSE="MPL-2.0"
SLOT="0"
[[ ${PV} == 9999 ]] || KEYWORDS="~amd64 ~x86"
IUSE="doc static-libs"

RDEPEND="
	dev-libs/icu:=
	dev-libs/librevenge
	media-libs/lcms:2
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	sys-devel/libtool
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
"

src_prepare() {
	base_src_prepare
	[[ -d m4 ]] || mkdir "m4"
	[[ ${PV} == 9999 ]] && eautoreconf
}

src_configure() {
	econf \
		--docdir="${EPREFIX}/usr/share/doc/${PF}" \
		$(use_enable static-libs static) \
		--disable-werror \
		$(use_with doc docs)
}

src_install() {
	default
	prune_libtool_files --all
}
