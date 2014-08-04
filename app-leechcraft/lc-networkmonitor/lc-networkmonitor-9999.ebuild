# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-leechcraft/lc-networkmonitor/lc-networkmonitor-9999.ebuild,v 1.1 2013/03/08 22:03:25 maksbotan Exp $

EAPI="4"

inherit leechcraft

DESCRIPTION="NetworkMonitor watches HTTP requests in for LeechCraft."

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}"
RDEPEND="${DEPEND}"
