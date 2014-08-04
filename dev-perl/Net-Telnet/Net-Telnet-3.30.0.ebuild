# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Net-Telnet/Net-Telnet-3.30.0.ebuild,v 1.4 2014/07/04 14:10:49 haubi Exp $

EAPI=4

MODULE_AUTHOR=JROGERS
MODULE_VERSION=3.03
inherit perl-module

DESCRIPTION="A Telnet Perl Module"

SLOT="0"
KEYWORDS="alpha amd64 ~arm hppa ia64 ~mips ppc ppc64 sparc x86 ~ppc-aix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""

RDEPEND=">=virtual/perl-libnet-1.0703"
DEPEND="${RDEPEND}"
