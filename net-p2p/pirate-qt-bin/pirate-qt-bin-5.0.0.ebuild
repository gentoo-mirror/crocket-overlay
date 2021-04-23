# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Binary package for pirate chain full node QT wallet"
HOMEPAGE="https://pirate.black"
SRC_URI="https://github.com/PirateNetwork/pirate/releases/download/v5.0.0/pirate-qt-ubuntu1804-v5.0.0.zip -> ${P}.zip"
LICENSE="MIT GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND=">=sys-libs/glibc-2.32
	sys-devel/gcc
	x11-libs/libxcb
	media-libs/fontconfig
	dev-libs/expat
	app-arch/bzip2
	media-libs/libpng
	dev-libs/libbsd"
RESTRICT="primaryuri"
S="${WORKDIR}"

src_install() {
	newbin pirate-qt-linux pirate-qt
}
