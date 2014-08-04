# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-misc/nepomukshell/nepomukshell-0.8.0.ebuild,v 1.1 2013/06/19 01:20:01 creffett Exp $

EAPI=5

inherit kde4-base

DESCRIPTION="Browse, query, and edit Nepomuk resources"
HOMEPAGE="https://projects.kde.org/projects/extragear/utils/nepomukshell"
SRC_URI="mirror://kde/unstable/nepomuk/${P}.tar.bz2"

LICENSE="GPL-2+"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kdelibs 'semantic-desktop(+)')
"

RDEPEND="${DEPEND}"
