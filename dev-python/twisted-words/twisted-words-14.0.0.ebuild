# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/twisted-words/twisted-words-14.0.0.ebuild,v 1.4 2014/06/03 20:58:01 jer Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7} )

inherit twisted-r1

DESCRIPTION="Twisted Words contains Instant Messaging implementations."

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

DEPEND="=dev-python/twisted-core-${TWISTED_RELEASE}*[${PYTHON_USEDEP}]
	=dev-python/twisted-web-${TWISTED_RELEASE}*[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"