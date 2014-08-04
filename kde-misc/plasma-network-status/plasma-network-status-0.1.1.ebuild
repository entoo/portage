# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-misc/plasma-network-status/plasma-network-status-0.1.1.ebuild,v 1.3 2014/03/21 18:51:10 johu Exp $

EAPI=5

inherit kde4-base

DESCRIPTION="KDE applet to monitor the network interface status."
HOMEPAGE="http://sourceforge.net/projects/pa-net-stat/"
SRC_URI="mirror://sourceforge/pa-net-stat/${P}-Source.tar.bz2"

SLOT="4"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}
	$(add_kdebase_dep plasma-workspace)
"

S="${WORKDIR}/${P}-Source"
