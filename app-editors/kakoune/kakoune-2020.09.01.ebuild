# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Modal editor inspired by vim"
HOMEPAGE="http://kakoune.org/ https://github.com/mawww/kakoune"
SRC_URI="https://github.com/mawww/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="sys-libs/ncurses:0=[unicode]"
RDEPEND="${DEPEND}"
RESTRICT="primaryuri"

src_install() {
	emake PREFIX="${ED}/usr" docdir="${ED}/usr/share/doc/${PF}" install
	rm "${ED}/usr/share/man/man1/kak.1.gz" || die
	doman doc/kak.1
}
