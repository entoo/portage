# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-plugins/google-talkplugin/google-talkplugin-4.4.2.0.ebuild,v 1.6 2014/05/16 18:58:12 swift Exp $

EAPI=5

inherit eutils nsplugins unpacker

if [ "${PV}" != "9999" ]; then
	DEB_PATCH="1"
	#http://dl.google.com/linux/talkplugin/deb/dists/stable/main/binary-i386/Packages
	MY_URL="http://dl.google.com/linux/talkplugin/deb/pool/main/${P:0:1}/${PN}"
	MY_PKG="${PN}_${PV}-${DEB_PATCH}_i386.deb"
	SRC_URI="x86? ( ${MY_URL}/${MY_PKG} )
		amd64? ( ${MY_URL}/${MY_PKG/i386/amd64} )"
else
	inherit cvs #hack to make it part of @live-rebuild
	MY_URL="http://dl.google.com/linux/direct"
	MY_PKG="${PN}_current_i386.deb"
	SRC_URI=""
fi

DESCRIPTION="Video chat browser plug-in for Google Talk"

HOMEPAGE="http://www.google.com/chat/video"
IUSE="libnotify selinux system-libCg video_cards_fglrx video_cards_radeon"
SLOT="0"

KEYWORDS="-* amd64 x86"
#GoogleTalkPlugin binary contains openssl and celt
LICENSE="Google-TOS openssl BSD system-libCg? ( NVIDIA-r1 )"

OBSOLETE="yes"
[[ $OBSOLETE = yes ]] && RESTRICT="fetch strip" || RESTRICT="strip mirror"

RDEPEND="|| ( media-sound/pulseaudio media-libs/alsa-lib )
	dev-libs/glib:2
	system-libCg? ( media-gfx/nvidia-cg-toolkit )
	media-libs/fontconfig
	media-libs/freetype:2
	sys-libs/glibc
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:2
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXt
	x11-libs/pango
	sys-apps/lsb-release
	virtual/opengl
	selinux? ( sec-policy/selinux-googletalk )
	libnotify? ( x11-libs/libnotify )"

DEPEND="selinux? ( sec-policy/selinux-googletalk )"

INSTALL_BASE="opt/google/talkplugin"

QA_PREBUILT="${INSTALL_BASE}/*"

S="${WORKDIR}"

LANGS="ar cs en et fr hu lt ms pl ru sv tl vi bg da fa gu id ja lv nl
sk ta tr bn de es fi hi is kn ml no sl te uk ca el fil hr it ko mr or
ro sr th ur"

for X in ${LANGS} ; do
	IUSE="${IUSE} linguas_${X}"
done

# nofetch means upstream bumped and thus needs version bump
pkg_nofetch() {
	if [[ ${OBSOLETE} = yes ]]; then
		elog "This version is no longer available from Google and the license prevents mirroring."
		elog "This ebuild is intended for users who already downloaded it previously and have problems"
		elog "with ${PV}+. If you can get the distfile from e.g. another computer of yours, or search"
		use amd64 && MY_PKG="${MY_PKG/i386/amd64}"
		elog "it with google: http://www.google.com/search?q=intitle:%22index+of%22+${MY_PKG}"
		elog "and copy the file ${MY_PKG} to ${DISTDIR}."
	else
		einfo "This version is no longer available from Google."
		einfo "Note that Gentoo cannot mirror the distfiles due to license reasons, so we have to follow the bump."
		einfo "Please file a version bump bug on http://bugs.gentoo.org (search	existing bugs for ${PN} first!)."
	fi
}

src_unpack() {
	local pkg="${A:=${MY_PKG}}"
	if [ "${PV}" = "9999" ]; then
		use amd64 && pkg="${pkg/i386/amd64}"
		einfo "Fetching ${pkg}"
		wget "${MY_URL}/${pkg}" || die
	fi
	unpacker ${pkg}
}

src_install() {
	unpacker usr/share/doc/google-talkplugin/changelog.Debian.gz
	dodoc changelog.Debian

	exeinto "/${INSTALL_BASE}"
	doexe "${INSTALL_BASE}"/GoogleTalkPlugin
	for i in "${INSTALL_BASE}"/lib*.so; do
		doexe "${i}"
		[[ ${i##*/} = libnp* ]] && inst_plugin "/${i}"
	done

	#install screen-sharing stuff - bug #397463
	insinto "/${INSTALL_BASE}"
	doins "${INSTALL_BASE}"/windowpicker.glade
	doins "${INSTALL_BASE}"/remoting24x24.png
	doins -r "${INSTALL_BASE}"/data

	strip-linguas ${LANGS}
	for l in ${LINGUAS}; do
		insinto "/${INSTALL_BASE}"/locale/$l/LC_MESSAGES/
		doins "${INSTALL_BASE}"/locale/$l/LC_MESSAGES/windowpicker.mo
	done

	#install bundled libCg
	if use video_cards_radeon || use video_cards_fglrx; then
		#hack from #402401
		exeinto "/${INSTALL_BASE}"/lib
		doexe "${INSTALL_BASE}"/lib/libCg*.so
		if use system-libCg; then
			ewarn "There seems to be a problem with ati cards and USE='-system-libCG,"
			ewarn "so we install the bundled version of libCG anyway. (bug #402401)"
		fi
		echo "O3D_OVERRIDE_RENDER_MODE=2D" > "${ED}/opt/google/talkplugin/envvars"
		ewarn "We have set O3D_OVERRIDE_RENDER_MODE=2D in ${EROOT}opt/google/talkplugin/envvars"
		ewarn "please report your experience, good or bad, with this workaround on bug #402401"
	elif ! use system-libCg; then
		exeinto "/${INSTALL_BASE}"/lib
		doexe "${INSTALL_BASE}"/lib/libCg*.so
	fi
}
