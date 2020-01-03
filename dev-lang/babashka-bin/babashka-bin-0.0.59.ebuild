# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ACTUAL_PN="babashka"
DESCRIPTION="A clojure interpreter"
HOMEPAGE="https://github.com/borkdude/babashka"
SRC_URI="https://github.com/borkdude/babashka/releases/download/v${PV}/${ACTUAL_PN}-${PV}-linux-amd64.zip -> ${P}.zip"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=""
S=${WORKDIR}

src_install() {
	dobin bb
}
