# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/blaze-html/blaze-html-0.7.0.2.ebuild,v 1.1 2014/07/02 03:48:01 gienah Exp $

EAPI=5

# ebuild generated by hackport 0.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A blazingly fast HTML combinator library for Haskell"
HOMEPAGE="http://jaspervdj.be/blaze"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/blaze-builder-0.2:=[profile?] <dev-haskell/blaze-builder-0.4:=[profile?]
	>=dev-haskell/blaze-markup-0.6:=[profile?] <dev-haskell/blaze-markup-0.7:=[profile?]
	>=dev-haskell/text-0.10:=[profile?] <dev-haskell/text-1.2:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/blaze-builder-0.2 <dev-haskell/blaze-builder-0.4
		>=dev-haskell/blaze-markup-0.6 <dev-haskell/blaze-markup-0.7
		>=dev-haskell/hunit-1.2 <dev-haskell/hunit-1.3
		>=dev-haskell/quickcheck-2.4 <dev-haskell/quickcheck-2.8
		>=dev-haskell/test-framework-0.4 <dev-haskell/test-framework-0.9
		>=dev-haskell/test-framework-hunit-0.3 <dev-haskell/test-framework-hunit-0.4
		>=dev-haskell/test-framework-quickcheck2-0.3 <dev-haskell/test-framework-quickcheck2-0.4
		>=dev-haskell/text-0.10 <dev-haskell/text-1.2 )
"