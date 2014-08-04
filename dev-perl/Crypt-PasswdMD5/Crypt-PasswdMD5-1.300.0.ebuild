# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Crypt-PasswdMD5/Crypt-PasswdMD5-1.300.0.ebuild,v 1.5 2013/04/21 15:10:05 hwoarang Exp $

EAPI=4

MODULE_AUTHOR=LUISMUNOZ
MODULE_VERSION=1.3
inherit perl-module

DESCRIPTION="Provides interoperable MD5-based crypt() functions"

LICENSE="${LICENSE} BEER-WARE"
SLOT="0"
KEYWORDS="amd64 ~arm ~mips ~ppc ~ppc64 ~sparc x86"
IUSE=""

SRC_TEST="do"
