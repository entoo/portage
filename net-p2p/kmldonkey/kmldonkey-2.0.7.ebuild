# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/kmldonkey/kmldonkey-2.0.7.ebuild,v 1.4 2013/06/11 15:53:14 ago Exp $

EAPI=5

inherit kde4-base

DESCRIPTION="Provides integration for the MLDonkey P2P software and KDE 4."
HOMEPAGE="http://www.kde.org/"
SRC_URI="https://api.opensuse.org/public/source/home:eduardhc/${PN}-kde4/${P}.tar.bz2"

LICENSE="GPL-2 LGPL-2"
SLOT="4"
KEYWORDS="amd64 x86"
IUSE="debug plasma"

DEPEND="plasma? ( $(add_kdebase_dep plasma-workspace) )"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with plasma)
	)

	kde4-base_src_configure
}

pkg_postinst() {
	if ! has_version net-p2p/mldonkey ; then
		elog ${PN} is a only a client, and requires access to an instance of
		elog net-p2p/mldonkey to function.
	fi
}
