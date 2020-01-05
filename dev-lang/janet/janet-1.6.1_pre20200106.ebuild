# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A functional and imperative language for scripting and embedding"
HOMEPAGE="https://janet-lang.org/"
GIT_COMMIT="17e47a798c8f9f7164feee123763b2963f5db30c"
SRC_URI="https://github.com/janet-lang/janet/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=""
DOCS=( CHANGELOG.md CONTRIBUTING.md README.md examples )
S="${WORKDIR}/${PN}-${GIT_COMMIT}"
