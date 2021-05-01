# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="This is a QT lite wallet for Pirate Chain."
HOMEPAGE="https://github.com/PirateNetwork/PirateWallet-Lite"
RESTRICT="primaryuri"
SRC_URI="https://github.com/PirateNetwork/PirateWallet-Lite/releases/download/${PV}/piratewallet-lite-v${PV}-ubuntu1804.tar.gz -> ${P}.tar.gz"
LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD Boost-1.0 CC0-1.0 ISC MIT MPL-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-qt/qtcore:5
	dev-qt/qtnetwork:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtwebsockets:5
	dev-libs/openssl:="
S="${WORKDIR}/piratewallet-lite-v${PV}"
DOCS="README.md"

src_install() {
	einstalldocs
	dobin piratewallet-lite
}
