# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.5.6

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A command line program for managing versions of dependencies in a cabal file"
HOMEPAGE="http://hackage.haskell.org/package/cabal-bounds"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/aeson-1.2.3.0:=[profile?] <dev-haskell/aeson-1.4:=[profile?]
	>=dev-haskell/cabal-2.2.0.0:=[profile?] <dev-haskell/cabal-2.3:=[profile?]
	>=dev-haskell/cabal-lenses-0.8.0:=[profile?] <dev-haskell/cabal-lenses-0.9:=[profile?]
	>=dev-haskell/cmdargs-0.10.5:=[profile?] <dev-haskell/cmdargs-0.11:=[profile?]
	>=dev-haskell/lens-4.0.1:=[profile?] <dev-haskell/lens-4.17:=[profile?]
	>=dev-haskell/lens-aeson-1.0.2:=[profile?] <dev-haskell/lens-aeson-1.1:=[profile?]
	>=dev-haskell/strict-0.3.2:=[profile?] <dev-haskell/strict-0.4:=[profile?]
	>=dev-haskell/text-1.1.0.1:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-haskell/unordered-containers-0.2.3.3:=[profile?] <dev-haskell/unordered-containers-0.3:=[profile?]
	>=dev-lang/ghc-8.2.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.0.0.2
	test? ( >=dev-haskell/glob-0.7 <dev-haskell/glob-0.10
		>=dev-haskell/tasty-0.9.0.1 <dev-haskell/tasty-1.2
		>=dev-haskell/tasty-golden-2.2.0.2 <dev-haskell/tasty-golden-2.4 )
"
