# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-abrt/selinux-abrt-2.20130424-r1.ebuild,v 1.2 2013/06/16 16:23:04 swift Exp $
EAPI="4"

IUSE=""
MODS="abrt"
BASEPOL="2.20130424-r1"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for abrt"

KEYWORDS="amd64 x86"
