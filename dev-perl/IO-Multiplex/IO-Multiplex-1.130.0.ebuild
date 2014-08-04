# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/IO-Multiplex/IO-Multiplex-1.130.0.ebuild,v 1.7 2014/05/01 12:13:57 zlogene Exp $

EAPI=4

MODULE_AUTHOR=MARKOV
MODULE_VERSION=1.13
inherit perl-module

DESCRIPTION="Manage IO on many file handles "

SLOT="0"
KEYWORDS="alpha amd64 ~arm hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

SRC_TEST="do"
