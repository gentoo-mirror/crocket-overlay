# Copyright 2018-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="rewrite of the Doukutsu Monogatari(Cave Story)"
HOMEPAGE="https://github.com/nxengine/nxengine-evo"
SRC_URI="https://github.com/nxengine/nxengine-evo/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://www.cavestory.org/downloads/cavestoryen.zip"
SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64"

DEPEND="
	media-libs/libpng:=
	media-libs/libsdl2:=
	media-libs/sdl2-mixer:=
	media-libs/sdl2-ttf:=
	media-libs/sdl2-image:=
	virtual/jpeg
"
BDEPEND="app-arch/unzip"

src_install() {
	cp -r "${WORKDIR}/CaveStory/data" "${WORKDIR}/CaveStory/Doukutsu.exe" . || die
	"${S}_build"/nxextract || die
	cmake_src_install
}
