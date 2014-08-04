# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Text-WrapI18N/Text-WrapI18N-0.60.0.ebuild,v 1.6 2014/04/06 15:10:09 vapier Exp $

EAPI=4

MODULE_AUTHOR=KUBOTA
MODULE_VERSION=0.06
inherit perl-module

DESCRIPTION="Internationalized substitute of Text::Wrap"

SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="dev-perl/Text-CharWidth"
DEPEND="${RDEPEND}"

SRC_TEST="do"
