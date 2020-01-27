# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools

DESCRIPTION="featureful ncurses based MPD client inspired by ncmpc"
HOMEPAGE="https://rybczak.net/ncmpcpp/"
GIT_COMMIT="bdec1eb00957cbfd4be814d6721c86bd21ed2158"
SRC_URI="https://github.com/arybczak/ncmpcpp/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${GIT_COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="clock outputs taglib visualizer"

RDEPEND="
	!dev-libs/boost:0/1.57.0
	>=media-libs/libmpdclient-2.1
	dev-libs/boost:=[icu,nls,threads]
	dev-libs/icu:=
	net-misc/curl
	sys-libs/ncurses:=[unicode]
	sys-libs/readline:*
	taglib? ( media-libs/taglib )
	visualizer? ( sci-libs/fftw:3.0= )
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"

src_prepare() {
	default

	sed -i -e '/^docdir/d' {,doc/}Makefile.am || die
	sed -i -e 's|COPYING||g' Makefile.am || die

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable clock) \
		$(use_enable outputs) \
		$(use_enable visualizer) \
		$(use_with taglib) \
		$(use_with visualizer fftw) \
		--docdir=/usr/share/doc/${PF}
}

src_install() {
	default

	dodoc doc/{bindings,config}
}

pkg_postinst() {
	echo
	elog "Example configuration files have been installed at"
	elog "${ROOT}/usr/share/doc/${PF}"
	elog "${P} uses ~/.ncmpcpp/config and ~/.ncmpcpp/bindings"
	elog "as user configuration files."
	echo
	if use visualizer; then
	elog "If you want to use the visualizer, you need mpd with fifo enabled."
	echo
	fi
}
