# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/virt-what/virt-what-1.12.ebuild,v 1.6 2014/05/15 11:37:37 jer Exp $

EAPI=5

inherit eutils

DESCRIPTION="Detects if the current machine is running in a virtual machine"
HOMEPAGE="http://people.redhat.com/~rjones/virt-what/"
SRC_URI="http://people.redhat.com/~rjones/virt-what/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~hppa x86"
IUSE="dmi"

DEPEND="dev-lang/perl"
RDEPEND="app-shells/bash
		dmi? ( sys-apps/dmidecode )"
