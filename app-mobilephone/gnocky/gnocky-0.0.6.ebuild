# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-mobilephone/gnocky/gnocky-0.0.6.ebuild,v 1.3 2012/05/02 20:10:08 jdhore Exp $

EAPI="2"

DESCRIPTION="GTK-2 version of gnokii"
HOMEPAGE="http://www.gnokii.org/"
SRC_URI="http://www.gnokii.org/download/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/gtk+:2
	gnome-base/libglade:2.0
	app-mobilephone/gnokii"
DEPEND="virtual/pkgconfig
	${RDEPEND}"

src_install()
{
	einstall || die "make install failed"
}
