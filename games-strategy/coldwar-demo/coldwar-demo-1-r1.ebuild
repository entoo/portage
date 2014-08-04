# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-strategy/coldwar-demo/coldwar-demo-1-r1.ebuild,v 1.5 2014/05/07 15:41:03 ulm Exp $

inherit eutils unpacker games

MY_PN=${PN%-demo}

DESCRIPTION="Third-person sneaker like Splinter Cell"
HOMEPAGE="http://linuxgamepublishing.com/info.php?id=coldwar"
SRC_URI="http://demofiles.linuxgamepublishing.com/coldwar/coldwar-demo.run"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror bindist strip"

RDEPEND="virtual/opengl
	x86? (
		media-libs/libogg
		media-libs/openal
		media-libs/libvorbis
		media-libs/smpeg
		dev-libs/glib
		x11-libs/libX11
		x11-libs/libXext )
	amd64? (
		app-emulation/emul-linux-x86-sdl
		app-emulation/emul-linux-x86-xlibs
		app-emulation/emul-linux-x86-medialibs )"
DEPEND=""

S=${WORKDIR}
dir=${GAMES_PREFIX_OPT}/${PN}

QA_PREBUILT="${dir:1}/lib/*
	${dir:1}/bin/meng"

src_unpack() {
	unpack_makeself
	unpack ./data/data.tar.gz

	mv bin/Linux/x86/${MY_PN}_demo .
	mv bin/Linux/x86/bin/meng bin

	rm -r bin/{Linux,*BSD} lgp_* setup.* data/data.tar.gz
}

src_install() {
	insinto "${dir}"
	doins -r * || die "doins -r * failed"
	rm "${D}/${dir}"/{${MY_PN}_demo,bin/{launcher,meng}}

	exeinto "${dir}"
	doexe ${MY_PN}_demo || die "doexe ${MY_PN}_demo failed"
	exeinto "${dir}/bin"
	doexe bin/{launcher,meng} || die "doexe bin failed"

	games_make_wrapper ${PN} ./${MY_PN}_demo "${dir}" "${dir}"
	newicon icon.xpm ${PN}.xpm || die "newicon failed"
	make_desktop_entry ${PN} "Cold War (Demo)" ${PN}

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst
	elog "The instruction manual is available as:"
	elog "   http://demofiles.linuxgamepublishing.com/coldwar/manual.pdf"
	echo
	einfo "To play the game, run: ${PN}"
}
