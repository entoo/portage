# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/liblogging/liblogging-1.0.4.ebuild,v 1.2 2014/08/10 20:36:02 slyfox Exp $

EAPI=5

inherit autotools-utils eutils

DESCRIPTION="Liblogging is an easy to use, portable, open source library for system logging"
HOMEPAGE="http://www.liblogging.org"
SRC_URI="http://download.rsyslog.com/liblogging/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0/0"
KEYWORDS="~amd64 ~arm ~hppa ~x86"
IUSE="rfc3195 static-libs +stdlog systemd"

RDEPEND="systemd? ( sys-apps/systemd )"

DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"

DOCS=( ChangeLog )

AUTOTOOLS_IN_SOURCE_BUILD=1

src_configure() {
	local myeconfargs=(
		$(use_enable rfc3195)
		$(use_enable stdlog)
		$(use_enable systemd journal)
	)
	autotools-utils_src_configure
}
