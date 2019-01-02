# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.5.6

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Lenses and traversals for the Cabal library"
HOMEPAGE="http://hackage.haskell.org/package/cabal-lenses"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/cabal-2.1.0.0:=[profile?] <dev-haskell/cabal-2.3:=[profile?]
	>=dev-haskell/lens-4.0.1:=[profile?] <dev-haskell/lens-4.17:=[profile?]
	>=dev-haskell/strict-0.3.2:=[profile?] <dev-haskell/strict-0.4:=[profile?]
	>=dev-haskell/system-fileio-0.3.12:=[profile?] <dev-haskell/system-fileio-0.4:=[profile?]
	>=dev-haskell/system-filepath-0.4.9:=[profile?] <dev-haskell/system-filepath-0.5:=[profile?]
	>=dev-haskell/text-1.1.0.1:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-haskell/unordered-containers-0.2.3.3:=[profile?] <dev-haskell/unordered-containers-0.3:=[profile?]
	>=dev-lang/ghc-7.10.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.22.2.0
"
