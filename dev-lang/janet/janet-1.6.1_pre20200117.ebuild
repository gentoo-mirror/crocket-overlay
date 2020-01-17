# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A functional and imperative language for scripting and embedding"
HOMEPAGE="https://janet-lang.org/"
GIT_COMMIT="d8841de18054d68c07b5e9c6cdec4a5e14d6ced3"
SRC_URI="https://github.com/janet-lang/janet/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=""
DOCS=( CHANGELOG.md CONTRIBUTING.md README.md examples )
S="${WORKDIR}/${PN}-${GIT_COMMIT}"

src_install() {
	meson_src_install
	dobin "${FILESDIR}/janet-repl"
}
