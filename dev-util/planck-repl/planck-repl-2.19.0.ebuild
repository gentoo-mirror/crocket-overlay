# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A stand-alone ClojureScript REPL based on JavaScriptCore."
HOMEPAGE="http://planck-repl.org/"
SRC_URI="https://github.com/planck-repl/planck/archive/${PV}.tar.gz -> planck-${PV}.tar.gz"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="fast"

CDEPEND=">=dev-lang/clojure-1.9:="
# clojure is required for dependency resolution by plk
RDEPEND="${CDEPEND}"
# xxd from vim is required for building planck
DEPEND="${CDEPEND}
	>=virtual/jdk-1.8
	|| ( sys-devel/gcc sys-devel/clang )
	sys-devel/make
	dev-util/cmake
	virtual/pkgconfig
	=net-libs/webkit-gtk-2*
	dev-util/xxdi
	app-arch/unzip"

S="${WORKDIR}/planck-${PV}"

src_compile() {
	if use fast; then
		env XXDI=xxdi.pl script/build --fast
	else
		env XXDI=xxdi.pl script/build
	fi
}

src_install() {
	script/install -p "${D}/usr"
}
