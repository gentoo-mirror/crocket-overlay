# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib

DESCRIPTION="A functional and imperative language for scripting and embedding"
HOMEPAGE="https://janet-lang.org/"
SRC_URI="https://github.com/janet-lang/janet/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=""
DOCS=( CHANGELOG.md CONTRIBUTING.md README.md )
PATCHES=( ${FILESDIR}/Makefile.patch )

src_install() {
	einstalldocs
	emake PREFIX="/usr" LIBDIR="/usr/$(get_libdir)" DESTDIR="${D}" install
}
