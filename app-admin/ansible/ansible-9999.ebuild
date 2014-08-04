# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/ansible/ansible-9999.ebuild,v 1.20 2014/07/30 11:57:13 jlec Exp $

EAPI="5"

PYTHON_COMPAT=( python2_7 )

EGIT_REPO_URI="git://github.com/ansible/ansible.git"
EGIT_BRANCH="devel"

inherit distutils-r1 git-r3 readme.gentoo

DESCRIPTION="Radically simple deployment, model-driven configuration management, and command execution framework"
HOMEPAGE="http://ansible.com/"
SRC_URI=""

KEYWORDS=""
LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DEPEND="test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/passlib[${PYTHON_USEDEP}]
		dev-vcs/git
	)"
RDEPEND="
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	net-misc/sshpass
	virtual/ssh
"

DOC_CONTENTS="You can define parameters through shell variables OR use config files
Examples of config files installed in /usr/share/doc/${PF}/examples\n\n
You have to create ansible hosts file!\n
More info on http://docs.ansible.com/intro_getting_started.html

Some optional dependencies, you might want to install:\n
dev-python/keyczar - needed to support accelerated mode\n
dev-python/paramiko - alternative SSH backend"\

python_test() {
	make tests || die "tests failed"
}

python_install_all() {
	distutils-r1_python_install_all

	doman docs/man/man1/*.1
	dodoc -r examples
	docompress -x /usr/share/doc/${PF}/examples
	# Hint: do not install example config files into /etc
	# let this choice to user

	newenvd "${FILESDIR}"/${PN}.env 95ansible
}

src_install() {
	distutils-r1_src_install
	readme.gentoo_create_doc
}
