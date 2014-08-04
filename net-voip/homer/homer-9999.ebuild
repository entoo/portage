# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-voip/homer/homer-9999.ebuild,v 1.8 2014/05/15 17:12:35 ulm Exp $

EAPI=5

inherit eutils multilib toolchain-funcs

DESCRIPTION="Homer Conferencing (short: Homer) is a free SIP softphone with advanced audio and video support."
HOMEPAGE="http://www.homer-conferencing.com"

MY_PN="Homer-Conferencing"
MY_BIN="Homer"

if [[ ${PV} == *9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="git://github.com/${MY_PN}/${MY_PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/${MY_PN}/${MY_PN}/archive/V${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="pulseaudio"

DEPEND=">=dev-libs/openssl-1.0
	media-libs/alsa-lib
	media-libs/libsdl[X,sound,video,alsa]
	media-libs/portaudio[alsa]
	media-libs/sdl-mixer
	media-libs/sdl-sound
	media-libs/x264:*
	media-video/ffmpeg:0[X]
	net-libs/sofia-sip
	dev-qt/qtcore:4
	dev-qt/qtdbus:4
	dev-qt/qtgui:4
	dev-qt/qtmultimedia:4
	dev-qt/qtwebkit:4
	pulseaudio? ( media-sound/pulseaudio )"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	if use pulseaudio; then
		sed -i \
			-e "/^set(FEATURE_PULSEAUDIO/s:OFF:ON:" \
			HomerBuild/config/HomerFeatures.txt || die "sed failed"
	fi
}

src_compile() {
	tc-export CXX
	emake -C HomerBuild default \
		INSTALL_PREFIX=/usr/bin \
		INSTALL_LIBDIR=/usr/$(get_libdir) \
		INSTALL_DATADIR=/usr/share/${PN} \
		VERBOSE=1
}

src_install() {
	emake -C HomerBuild install \
		DESTDIR="${D}" \
		VERBOSE=1

	# Create .desktop entry
	doicon ${MY_BIN}/${MY_BIN}.png
	make_desktop_entry "${MY_BIN}" "${MY_PN}" "${MY_BIN}" "Network;InstantMessaging;Telephony;VideoConference"
}