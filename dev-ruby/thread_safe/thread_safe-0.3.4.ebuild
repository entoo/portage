# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/thread_safe/thread_safe-0.3.4.ebuild,v 1.2 2014/07/07 12:03:37 klausman Exp $

EAPI=5
# jruby → there is code for this in ext but that requires compiling java.
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="A collection of thread-safe versions of common core Ruby classes"
HOMEPAGE="https://github.com/headius/thread_safe"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~x86"
IUSE=""

# Higher atomic dependency since earlier versions crash on ruby20 while
# running thread_safe tests.
ruby_add_bdepend "test? ( >=dev-ruby/atomic-1.1.16 >=dev-ruby/minitest-4 )"

each_ruby_prepare(){
	sed -i -e "/[Bb]undler/d" Rakefile || die
}

each_ruby_test() {
	einfo "The test suite may take up to 10 minutes to run without apparent feedback"
	each_fakegem_test
}