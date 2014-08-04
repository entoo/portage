# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-wireless/gr-osmosdr/gr-osmosdr-0.1.1.ebuild,v 1.2 2014/07/25 05:00:25 zerochaos Exp $

EAPI=5
PYTHON_DEPEND="python? 2"

inherit cmake-utils python

DESCRIPTION="GNU Radio source block for OsmoSDR and rtlsdr and hackrf"
HOMEPAGE="http://sdr.osmocom.org/trac/wiki/GrOsmoSDR"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="git://git.osmocom.org/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://dev.gentoo.org/~zerochaos/distfiles/${P}.tar.xz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3"
SLOT="0/${PV}"
IUSE="bladerf fcd hackrf iqbalance python rtlsdr uhd"
#IUSE="bladerf fcd hackrf iqbalance mirisdr osmosdr python rtlsdr uhd"

#	osmosdr? ( net-libs/libosmosdr:= )

#from "git show v0.1.1"
#gnuradio 3.7.3
#uhd 003.007.000-1-ga8caec5f
#librtlsdr v0.5.3-5-g6ee5
#libosmosdr v0.1-43-gb697
#libmirisdr 3174
#libhackrf 0.3
#gr-iqbal v0.37.1-5-gd4fd4dd4
#libairspy 9350af1a
#libbladeRF 0.14.0-git-d9db543
#gr-fcdproplus 1edbe523

RDEPEND=">=net-wireless/gnuradio-3.7_rc:0=[fcd?]
	bladerf? ( net-wireless/bladerf:= )
	hackrf? ( net-libs/libhackrf:= )
	iqbalance? ( net-wireless/gr-iqbal:= )
	rtlsdr? ( >=net-wireless/rtl-sdr-0.5.3:= )
	uhd? ( net-wireless/uhd:= )"
DEPEND="${RDEPEND}
	dev-python/cheetah"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	python_convert_shebangs -q -r 2 "${S}"
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_DEFAULT=OFF
		$(cmake-utils_use_enable bladerf)
		$(cmake-utils_use_enable fcd)
		$(cmake-utils_use_enable hackrf)
		$(cmake-utils_use_enable iqbalance)
		$(cmake-utils_use_enable python)
		$(cmake-utils_use_enable rtlsdr RTL)
		$(cmake-utils_use_enable rtlsdr RTL_TCP)
		$(cmake-utils_use_enable uhd)
	)
#		$(cmake-utils_use_enable osmosdr)

	cmake-utils_src_configure
}
