# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-chemistry/votca-csg/votca-csg-1.2.3-r1.ebuild,v 1.1 2013/04/14 17:52:29 ottxor Exp $

EAPI=5

inherit bash-completion-r1 cmake-utils multilib

IUSE="doc examples extras +gromacs +system-boost"
PDEPEND="extras? ( =sci-chemistry/votca-csgapps-${PV} )"
if [ "${PV}" != "9999" ]; then
	SRC_URI="http://votca.googlecode.com/files/${P}.tar.gz
		doc? ( http://votca.googlecode.com/files/${PN}-manual-${PV}.pdf )
		examples? (	http://votca.googlecode.com/files/${PN}-tutorials-${PV}.tar.gz )"
	RESTRICT="primaryuri"
else
	SRC_URI=""
	inherit mercurial
	EHG_REPO_URI="https://csg.votca.googlecode.com/hg"
	PDEPEND="${PDEPEND} doc? ( =app-doc/${PN}-manual-${PV} )
		examples? ( =sci-chemistry/${PN}-tutorials-${PV} )"
fi

DESCRIPTION="Votca coarse-graining engine"
HOMEPAGE="http://www.votca.org"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-macos"

#perl is only used for scripts
RDEPEND="~sci-libs/votca-tools-${PV}[system-boost=]
	gromacs? ( sci-chemistry/gromacs:= )
	dev-lang/perl
	app-shells/bash"

DEPEND="${RDEPEND}
	doc? ( || ( <app-doc/doxygen-1.7.6.1[-nodot] >=app-doc/doxygen-1.7.6.1[dot] ) )
	>=app-text/txt2tags-2.5
	virtual/pkgconfig"

DOCS=(README NOTICE ChangeLog)

src_configure() {
	local GMX_DEV="OFF" GMX_DOUBLE="OFF" extra

	if use gromacs; then
		has_version =sci-chemistry/gromacs-9999 && GMX_DEV="ON"
		has_version sci-chemistry/gromacs[double-precision] && GMX_DOUBLE="ON"
	fi

	#to create man pages, build tree binaries are executed (bug #398437)
	[[ ${CHOST} = *-darwin* ]] && \
		extra+=" -DCMAKE_BUILD_WITH_INSTALL_RPATH=OFF"

	mycmakeargs=(
		$(cmake-utils_use system-boost EXTERNAL_BOOST)
		$(cmake-utils_use_with gromacs GMX)
		-DWITH_GMX_DEVEL="${GMX_DEV}"
		-DGMX_DOUBLE="${GMX_DOUBLE}"
		${extra}
		-DWITH_RC_FILES=OFF
		-DLIB=$(get_libdir)
	)
	cmake-utils_src_configure
}

src_install() {
	newbashcomp scripts/csg-completion.bash ${PN}
	cmake-utils_src_install
	if use doc; then
		if [ -n "${PV##*9999}" ]; then
			dodoc "${DISTDIR}/${PN}-manual-${PV}.pdf"
		fi
		cd "${CMAKE_BUILD_DIR}" || die
		cd share/doc || die
		doxygen || die
		dohtml -r html/*
	fi
	if use examples && [ -n "${PV##*9999}" ]; then
		insinto "/usr/share/doc/${PF}/tutorials"
		docompress -x "/usr/share/doc/${PF}/tutorials"
		doins -r "${WORKDIR}/${PN}-tutorials-${PV}"/*
	fi
}

pkg_postinst() {
	einfo
	einfo "Please read and cite:"
	einfo "VOTCA, J. Chem. Theory Comput. 5, 3211 (2009). "
	einfo "http://dx.doi.org/10.1021/ct900369w"
	einfo
}
