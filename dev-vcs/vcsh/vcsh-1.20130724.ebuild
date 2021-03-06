# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-vcs/vcsh/vcsh-1.20130724.ebuild,v 1.1 2013/08/09 03:06:54 patrick Exp $

EAPI=4

DESCRIPTION='Manage config files in $HOME via fake bare git repositories'
HOMEPAGE="https://github.com/RichiH/vcsh/blob/master/README.md"
SRC_URI="http://github.com/RichiH/vcsh/archive/v${PV}-1.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( GPL-3 GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-vcs/git"
DEPEND="app-text/ronn"

DOCS=( changelog )

S=${S}-1
src_prepare() {
	default
	sed -i \
		-e 's,vendor-completions,site-functions,' \
		-e "s,share/doc/\$(self),share/doc/${PF}," \
		Makefile || die
}
