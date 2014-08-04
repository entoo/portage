# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libbluray/libbluray-0.3.0-r1.ebuild,v 1.7 2013/09/22 13:59:37 lu_zero Exp $

EAPI=5

inherit autotools java-pkg-opt-2 flag-o-matic eutils

DESCRIPTION="Blu-ray playback libraries"
HOMEPAGE="http://www.videolan.org/developers/libbluray.html"
SRC_URI="http://ftp.videolan.org/pub/videolan/libbluray/${PV}/${P}.tar.bz2
	java? ( http://dev.gentoo.org/~radhermit/dist/${P}-java.patch.bz2 )"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE="aacs java static-libs +truetype utils +xml"

COMMON_DEPEND="
	xml? ( dev-libs/libxml2 )
"
RDEPEND="
	${COMMON_DEPEND}
	aacs? ( media-libs/libaacs )
	java? (
		truetype? ( media-libs/freetype:2 )
		>=virtual/jre-1.6
	)
"
DEPEND="
	${COMMON_DEPEND}
	java? (
		truetype? ( media-libs/freetype:2 )
		>=virtual/jdk-1.6
		dev-java/ant-core
	)
	virtual/pkgconfig
"

DOCS=( ChangeLog README.txt )

src_prepare() {
	if use java ; then
		export JDK_HOME="$(java-config -g JAVA_HOME)"

		# upstream 0.3.0 tarball is missing a lot of java files
		EPATCH_OPTS="-p1" epatch "${WORKDIR}"/${P}-java.patch

		# don't install a duplicate jar file
		sed -i '/^jar_DATA/d' src/Makefile.am || die

		eautoreconf

		java-pkg-opt-2_src_prepare
	fi
}

src_configure() {
	local myconf
	if use java; then
		export JAVACFLAGS="$(java-pkg_javac-args)"
		append-cflags "$(java-pkg_get-jni-cflags)"
		myconf="$(use_with truetype freetype)"
	fi

	econf \
		--disable-optimizations \
		$(use_enable utils examples) \
		$(use_enable java bdjava) \
		$(use_enable static-libs static) \
		$(use_with xml libxml2) \
		${myconf}
}

src_install() {
	default

	if use utils; then
		cd src/examples/
		dobin clpi_dump index_dump mobj_dump mpls_dump sound_dump
		cd .libs/
		dobin bd_info bdsplice hdmv_test libbluray_test list_titles
		if use java; then
			dobin bdj_test
		fi
	fi

	if use java; then
		java-pkg_dojar "${S}/src/.libs/${PN}.jar"
		doenvd "${FILESDIR}"/90${PN}
	fi

	prune_libtool_files
}
