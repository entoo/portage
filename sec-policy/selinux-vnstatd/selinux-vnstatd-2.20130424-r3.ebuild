# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-vnstatd/selinux-vnstatd-2.20130424-r3.ebuild,v 1.1 2013/09/26 17:24:30 swift Exp $
EAPI="4"

IUSE=""
MODS="vnstatd"
BASEPOL="2.20130424-r3"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for vnstatd"

KEYWORDS="~amd64 ~x86"
