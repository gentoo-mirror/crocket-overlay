# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit font

DESCRIPTION="Dynamic korean hand-written font"
HOMEPAGE="http://hangeul.naver.com"
SRC_URI="mirror://crocket/${P}-OTF.zip
	mirror://crocket/${P}-TTF.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND=""
RDEPEND=""

FONT_SUFFIX="otf ttf"
S="${WORKDIR}"
