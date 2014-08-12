# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/PEAR-Crypt_GPG/PEAR-Crypt_GPG-1.3.2.ebuild,v 1.2 2014/08/12 10:48:24 jer Exp $

EAPI="4"

inherit php-pear-r1

DESCRIPTION="GNU Privacy Guard (GnuPG)"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~x86"
IUSE=""
DEPEND=">=dev-lang/php-5.2.1"
RDEPEND="${DEPEND}
	app-crypt/gnupg"
