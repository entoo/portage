# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-leechcraft/lc-popishu/lc-popishu-9999.ebuild,v 1.1 2013/03/08 22:04:52 maksbotan Exp $

EAPI="4"

inherit leechcraft

DESCRIPTION="Popishu, the text editor with IDE features for LeechCraft."

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	x11-libs/qscintilla"
RDEPEND="${DEPEND}"
