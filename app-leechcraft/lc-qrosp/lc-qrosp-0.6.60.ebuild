# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-leechcraft/lc-qrosp/lc-qrosp-0.6.60.ebuild,v 1.3 2014/04/03 08:50:22 zlogene Exp $

EAPI="4"

inherit leechcraft

DESCRIPTION="Qrosp, scrpting support for LeechCraft via Qross."

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-libs/qjson
	dev-libs/qrosscore"
RDEPEND="${DEPEND}"
