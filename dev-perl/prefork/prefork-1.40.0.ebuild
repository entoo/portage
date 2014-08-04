# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/prefork/prefork-1.40.0.ebuild,v 1.6 2014/02/02 00:11:08 vapier Exp $

EAPI=4

MODULE_AUTHOR=ADAMK
MODULE_VERSION=1.04
inherit perl-module

DESCRIPTION="Optimized module loading for forking or non-forking processes"

SLOT="0"
KEYWORDS="alpha amd64 ~arm arm64 hppa ia64 m68k ~mips ppc ~ppc64 s390 sh sparc x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""

DEPEND=">=virtual/perl-File-Spec-0.80
	>=virtual/perl-Scalar-List-Utils-1.10"
RDEPEND="${DEPEND}"

SRC_TEST="do"
