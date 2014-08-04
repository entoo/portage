# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-office/scribus/scribus-1.4.1-r1.ebuild,v 1.6 2013/07/02 13:55:01 jlec Exp $

EAPI=4

PYTHON_DEPEND="2"

inherit cmake-utils fdo-mime multilib python

DESCRIPTION="Desktop publishing (DTP) and layout program"
HOMEPAGE="http://www.scribus.net/"
SRC_URI="mirror://sourceforge/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 hppa ~ppc ~ppc64 ~sparc x86"
IUSE="cairo debug examples +minimal +pdf spell templates"

# a=$(ls resources/translations/po/scribus.*ts | sed -e 's:\.: :g' | awk '{print $2}'); echo ${a}
IUSE_LINGUAS=" af ar bg br ca cs_CZ cy da_DK de_1901 de_CH de el en_AU en_GB en_US es_ES et eu fi fr gl hu id it ja ko lt_LT nb_NO nl pl_PL pt_BR pt ru sa sk_SK sl sq sr sv th_TH tr uk zh_CN zh_TW"
IUSE+=" ${IUSE_LINGUAS// / linguas_}"

COMMON_DEPEND="
	dev-libs/hyphen
	dev-libs/libxml2
	media-libs/fontconfig
	media-libs/freetype:2
	media-libs/lcms:2
	media-libs/libpng:0
	media-libs/tiff:0
	net-print/cups
	sys-libs/zlib[minizip]
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	virtual/jpeg
	spell? ( app-text/aspell )
	pdf? ( app-text/podofo )
	cairo? ( x11-libs/cairo[X,svg] )"
RDEPEND="${COMMON_DEPEND}
	app-text/ghostscript-gpl"
DEPEND="${COMMON_DEPEND}
	dev-libs/boost"

S="${WORKDIR}"/Scribus

PATCHES=(
	"${FILESDIR}"/${PN}-1.4.0_rc5-docs.patch
#	"${FILESDIR}"/${P}-export.patch
	"${FILESDIR}"/${PN}-1.4.0-minizip.patch
	)

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	cat > cmake/modules/FindZLIB.cmake <<- EOF
	find_package(PkgConfig)
	pkg_check_modules(ZLIB minizip zlib)
	SET( ZLIB_LIBRARY \${ZLIB_LIBRARIES} )
	SET( ZLIB_INCLUDE_DIR \${ZLIB_INCLUDE_DIRS} )
	MARK_AS_ADVANCED( ZLIB_LIBRARY ZLIB_INCLUDE_DIR )
	EOF

	rm scribus/{ioapi,unzip}.[ch] || die

	if ! use templates; then
		sed '/ADD_SUBDIRECTORY(resources\/templates)/d' -i CMakeLists.txt || die
	fi
	if ! use examples; then
		sed '/ADD_SUBDIRECTORY(samples)/d' -i scribus/plugins/scriptplugin/CMakeLists.txt || die
	fi

	cmake-utils_src_prepare
}

src_configure() {
	local lang langs
	for lang in ${IUSE_LINGUAS}; do
		use linguas_${lang} && langs+=",${lang}"
	done

	local mycmakeargs=(
		-DHAVE_PYTHON=ON
		-DPYTHON_INCLUDE_PATH=$(python_get_includedir)
		-DPYTHON_LIBRARY=$(python_get_library)
		-DWANT_NORPATH=ON
		-DWANT_QTARTHUR=ON
		-DWANT_QT3SUPPORT=OFF
		-DGENTOOVERSION=${PVR}
		-DWANT_GUI_LANG=${langs#,}
		$(cmake-utils_use_has spell ASPELL)
		$(cmake-utils_use_has pdf PODOFO)
		$(cmake-utils_use_want cairo)
		$(cmake-utils_use_want minimal NOHEADERINSTALL)
		$(cmake-utils_use_want debug DEBUG)
		)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	mv "${ED}"/usr/share/doc/${PF}/{en,html} || die
	ln -sf html "${ED}"/usr/share/doc/${PF}/en || die
	use linguas_de || rm -rf "${ED}"/usr/share/doc/${PF}/de
	use linguas_it || rm -rf "${ED}"/usr/share/doc/${PF}/it
	docompress -x /usr/share/doc/${PF}/en
	doicon resources/icons/scribus.png
	domenu scribus.desktop
}

pkg_preinst() {
	# 399595
	rm -vf "${ED}"/usr/share/doc/${PF}/en* || die
	ln -sf html "${ED}"/usr/share/doc/${PF}/en
}

pkg_postinst() {
	fdo-mime_mime_database_update
}

pkg_postrm() {
	fdo-mime_mime_database_update
}
