# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-evolution/selinux-evolution-2.20130424-r4.ebuild,v 1.2 2014/01/12 20:22:12 swift Exp $
EAPI="4"

IUSE=""
MODS="evolution"
BASEPOL="2.20130424-r4"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for evolution"

KEYWORDS="amd64 x86"
DEPEND="${DEPEND}
	sec-policy/selinux-xserver
"
RDEPEND="${DEPEND}"
