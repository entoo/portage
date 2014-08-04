# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-strategy/gorky17-demo/gorky17-demo-1.0.1.0.1.ebuild,v 1.6 2014/05/06 16:03:49 ulm Exp $

inherit eutils unpacker versionator games

MY_PN="gorky17"
MY_PV=$(replace_version_separator 2 '-')

DESCRIPTION="Horror conspiracy game mixing elements of strategy and role-playing"
HOMEPAGE="http://www.linuxgamepublishing.com/info.php?id=gorky17"
SRC_URI="http://demofiles.linuxgamepublishing.com/${MY_PN}/${MY_PN}_demo.run
	http://updatefiles.linuxgamepublishing.com/gorky17-demo/${PN}-${MY_PV}-x86.run"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="mirror bindist strip"

RDEPEND="media-libs/alsa-lib
	x86? (
		media-libs/libsdl
		sys-libs/zlib
		x11-libs/libX11
		x11-libs/libXau
		x11-libs/libXdmcp
		x11-libs/libXext )
	amd64? (
		app-emulation/emul-linux-x86-baselibs
		app-emulation/emul-linux-x86-xlibs
		app-emulation/emul-linux-x86-soundlibs
		app-emulation/emul-linux-x86-sdl )"

S=${WORKDIR}

dir=${GAMES_PREFIX_OPT}/${PN}
Ddir=${D}/${dir}

QA_EXECSTACK="${dir:1}/gorky17_demo ${dir:1}/gorky17_demo.dynamic"

src_unpack() {
	unpack_makeself ${MY_PN}_demo.run
	unpack ./data/data.tar.gz

	mkdir patch
	cd patch
	unpack_makeself ${PN}-${MY_PV}-x86.run
	cd "${S}"

	# Apply patch
	mv bin/Linux/x86/* .
	mv patch/*.sh .
	./patch/bin/Linux/x86/loki_patch patch/patch.dat . \
		|| die "loki_patch failed"

	rm -r update.sh *patch.sh data lgp_* patch setup* bin
}

src_install() {
	insinto "${dir}"
	doins -r * || die "doins -r failed"
	rm "${Ddir}"/${MY_PN}*

	exeinto "${dir}"
	doexe ${MY_PN}* || die "doexe failed"

	games_make_wrapper ${PN} ./${MY_PN}_demo "${dir}" "${dir}"
	newicon icon.xpm ${PN}.xpm
	make_desktop_entry ${PN} "Gorky 17 (Demo)" ${PN}

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog "The instruction manual is available as:"
	elog "   http://demofiles.linuxgamepublishing.com/gorky17/manual.pdf"
	echo
}
