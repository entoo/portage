# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Email-MIME-Encodings/Email-MIME-Encodings-1.313.0.ebuild,v 1.2 2011/09/03 21:04:43 tove Exp $

EAPI=4

MODULE_AUTHOR=RJBS
MODULE_VERSION=1.313
inherit perl-module

DESCRIPTION="A unified interface to MIME encoding and decoding"

SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86 ~sparc-solaris ~x86-solaris"
IUSE="test"

RDEPEND=">=virtual/perl-MIME-Base64-3.07"
DEPEND="${RDEPEND}
	test? (
		dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage
	)"

SRC_TEST="do"
