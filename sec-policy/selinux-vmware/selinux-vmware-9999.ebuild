# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-vmware/selinux-vmware-9999.ebuild,v 1.1 2012/10/13 16:31:02 swift Exp $
EAPI="4"

IUSE=""
MODS="vmware"
BASEPOL="9999"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for vmware"

KEYWORDS=""
DEPEND="${DEPEND}
	sec-policy/selinux-xserver
"
RDEPEND="${DEPEND}"
