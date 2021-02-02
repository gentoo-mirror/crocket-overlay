# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A Dynamic DNS Client written in janet"
HOMEPAGE="https://gitlab.com/croquet/jddclient"
SRC_URI="https://gitlab.com/croquet/jddclient/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-lang/janet
	dev-janet/argparse
	dev-janet/sh
	dev-janet/http"

DOCS="README.adoc"

src_compile() {
	jpm build || die
}

src_install() {
	einstalldocs
	dobin build/jddclient
	exeinto /etc/init.d
	newexe "${FILESDIR}/jddclient-openrc" jddclient
}
