# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/flask-xml-rpc/flask-xml-rpc-0.1.2-r1.ebuild,v 1.2 2013/06/17 02:39:01 patrick Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

MY_PN="Flask-XML-RPC"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="XML-RPC support for Flask applications."
HOMEPAGE="http://packages.python.org/Flask-XML-RPC/ http://pypi.python.org/pypi/Flask-XML-RPC"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/flask[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"

python_test() {
	nosetests || die
}
