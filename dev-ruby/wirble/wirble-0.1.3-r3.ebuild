# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/wirble/wirble-0.1.3-r3.ebuild,v 1.1 2014/05/23 05:32:24 graaff Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README ChangeLog"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Wirble is a set of enhancements for Irb."
HOMEPAGE="http://pablotron.org/software/wirble/"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

pkg_postinst() {
	elog "The quick way to use wirble is to make your ~/.irbrc look like this:"
	elog "  # load libraries"
	elog "  require 'rubygems'"
	elog "  require 'wirble'"
	elog "  "
	elog "  # start wirble (with color)"
	elog "  Wirble.init"
	elog "  Wirble.colorize"
}