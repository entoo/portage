# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/nagstamon/nagstamon-0.9.12_p20140402.ebuild,v 1.2 2014/04/03 21:32:53 idl0r Exp $

EAPI="5"

PYTHON_COMPAT=( python2_6 python2_7 )

inherit eutils python-r1

MY_PN="Nagstamon"
#MY_P="${MY_PN}-${PV/_/}-20130729"

DESCRIPTION="Nagstamon is a Nagios status monitor for a systray and displays a realtime status of a Nagios box"
HOMEPAGE="http://nagstamon.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome sound"

DEPEND=""
RDEPEND="dev-python/pygobject:2
	dev-python/pygtk
	dev-python/lxml
	dev-python/beautifulsoup:python-2
	gnome-base/librsvg
	dev-python/keyring
	gnome? ( dev-python/egg-python )
	sound? ( media-sound/sox )"

S="${WORKDIR}/${MY_PN}"

src_prepare() {
	epatch "${FILESDIR}/nagstamon-0.9.11_rc1-resources.patch"

	rm Nagstamon/resources/LICENSE
	rm Nagstamon/BeautifulSoup.py
}

src_install() {
	# setup.py is broken
	cd Nagstamon/

	doman resources/nagstamon.1
	rm resources/nagstamon.1

	newbin ../nagstamon.py nagstamon

	nagstamon_install() {
		insinto $(python_get_sitedir)/${MY_PN}
		doins {GUI,Config,Objects,Custom,Actions}.py
		touch "${D}/$(python_get_sitedir)/${MY_PN}/__init__.py" || die
		doins -r Server/

		insinto /usr/share/${PN}/resources
		doins resources/*

		domenu "${FILESDIR}"/${PN}.desktop
	}

	python_foreach_impl nagstamon_install

	python_replicate_script "${D}/usr/bin/nagstamon"
}