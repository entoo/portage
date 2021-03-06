# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/jsonpatch/jsonpatch-0.12.ebuild,v 1.3 2014/03/19 18:24:09 bicatali Exp $

EAPI=5
PYTHON_COMPAT=( python2_6 python2_7 )

inherit distutils-r1

DESCRIPTION="Apply JSON-Patches according to
http://tools.ietf.org/html/draft-pbryan-json-patch-04"
HOMEPAGE="https://github.com/stefankoegl/python-json-patch"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/jsonpointer[${PYTHON_USEDEP}]"
