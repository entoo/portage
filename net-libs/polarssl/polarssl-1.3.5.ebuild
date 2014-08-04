# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/polarssl/polarssl-1.3.5.ebuild,v 1.2 2014/06/18 20:41:00 mgorny Exp $

EAPI=5

inherit eutils multilib toolchain-funcs cmake-utils multilib-minimal

DESCRIPTION="Cryptographic library for embedded systems"
HOMEPAGE="http://polarssl.org/"
SRC_URI="http://polarssl.org/download/${P}-gpl.tgz"

LICENSE="GPL-2"
SLOT="0/5"
KEYWORDS="~amd64 ~arm ~hppa ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-fbsd ~x86-fbsd"
IUSE="havege programs sse2 static-libs zlib"

RDEPEND="
	programs? (
		dev-libs/openssl:0
		amd64? ( abi_x86_32? (
			|| (
				>=dev-libs/openssl-1.0.1h-r2:0[abi_x86_32]
				app-emulation/emul-linux-x86-baselibs
			)
		) )
	)
	zlib? ( >=sys-libs/zlib-1.2.8-r1[${MULTILIB_USEDEP}] )"
DEPEND="${RDEPEND}"

enable_polarssl_option() {
	local myopt="$@"
	# check that config.h syntax is the same at version bump
	sed -i \
		-e "s://#define ${myopt}:#define ${myopt}:" \
		include/polarssl/config.h || die
}

src_prepare() {
	use sse2 && enable_polarssl_option POLARSSL_HAVE_SSE2
	use zlib && enable_polarssl_option POLARSSL_ZLIB_SUPPORT
	use havege && enable_polarssl_option POLARSSL_HAVEGE_C
}

multilib_src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable programs PROGRAMS)
		$(cmake-utils_use_enable zlib ZLIB_SUPPORT)
		$(cmake-utils_use_use static-libs STATIC_POLARSSL_LIBRARY)
		-DUSE_SHARED_POLARSSL_LIBRARY=ON
		-DINSTALL_POLARSSL_HEADERS=ON
		-DLIB_INSTALL_DIR="/usr/$(get_libdir)"
	)

	cmake-utils_src_configure
}

multilib_src_compile() {
	cmake-utils_src_compile
}

multilib_src_test() {
	LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${BUILD_DIR}/library" cmake-utils_src_test
}

multilib_src_install() {
	cmake-utils_src_install
}

multilib_src_install_all() {
	einstalldocs

	if use programs ; then
		# avoid file collisions with sys-apps/coreutils
		local p e
		for p in "${ED%/}"/usr/bin/* ; do
			if [[ -x "${p}" && ! -d "${p}" ]] ; then
				mv "${p}" "${ED%/}"/usr/bin/polarssl_`basename "${p}"` || die
			fi
		done
		for e in aes hash pkey ssl test ; do
			docinto "${e}"
			dodoc programs/"${e}"/*.c
			dodoc programs/"${e}"/*.txt
		done
	fi
}
