# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/lz4/lz4-0_p120.ebuild,v 1.1 2014/07/31 17:41:30 ryao Exp $

EAPI=5

inherit multilib multilib-minimal

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Cyan4973/lz4.git"
	EGIT_BRANCH=dev
else
	MY_PV="r${PV##0_p}"
	MY_P="${PN}-${MY_PV}"
	SRC_URI="https://github.com/Cyan4973/lz4/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~mips ~s390 ~x86 ~amd64-linux ~x86-linux"
	S="${WORKDIR}/${MY_P}"
fi

DESCRIPTION="Extremely Fast Compression algorithm"
HOMEPAGE="https://code.google.com/p/lz4/"

LICENSE="BSD-2 GPL-2"
SLOT="0"
IUSE="test"

RDEPEND=""
DEPEND="test? ( dev-util/valgrind )"

src_prepare() {
	multilib_copy_sources
}

multilib_src_compile() {
	# we must not use the 'all' target since it builds test programs
	# & extra -m32 executables
	emake
	emake -C programs
}

multilib_src_install() {
	emake install DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr" \
		LIBDIR="${EPREFIX}"/usr/$(get_libdir)
}