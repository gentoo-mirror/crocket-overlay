# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A dynamic programming language that targets the Java Virtual Machine"
HOMEPAGE="https://clojure.org/"
SRC_URI="https://download.clojure.org/install/${PN}-tools-${PV}.tar.gz"

LICENSE="EPL-1.0 Apache-2.0"
SLOT="1.10"
KEYWORDS="~amd64"

RDEPEND=">=virtual/jre-1.8
	app-misc/rlwrap"
DEPEND=""

S="${WORKDIR}/${PN}-tools"
CLOJURE_LIB_DIR="/usr/share/${PN}"

src_prepare() {
	default
	sed -i -e "s|PREFIX|$CLOJURE_LIB_DIR|g" clojure || die
}

src_install() {
	insinto $CLOJURE_LIB_DIR
	doins deps.edn
	doins example-deps.edn
	insinto $CLOJURE_LIB_DIR/libexec
	doins ${PN}-tools-${PV}.jar

	dobin clojure
	dobin clj

	doman clojure.1
	doman clj.1
}
