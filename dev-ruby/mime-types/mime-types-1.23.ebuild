# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mime-types/mime-types-1.23.ebuild,v 1.8 2014/07/22 15:56:28 klausman Exp $

EAPI=5

USE_RUBY="ruby19 ruby20 jruby"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Provides a mailcap-like MIME Content-Type lookup for Ruby."
HOMEPAGE="http://rubyforge.org/projects/mime-types"

LICENSE="MIT Artistic GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~ia64 ppc ppc64 x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_bdepend "test? ( virtual/ruby-minitest )"

each_ruby_test() {
	${RUBY} -Ilib -S testrb test/test_*.rb || die
}