# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit font

DESCRIPTION="Korean fonts distributed by naver"
HOMEPAGE="http://hangeul.naver.com"
SRC_URI="mirror://crocket/NanumBarunGothic-2018-OTF.zip
	mirror://crocket/NanumBarunGothic-2018-TTF.zip
	mirror://crocket/NanumBarunGothicYetHanGul-2014-OTF.zip
	mirror://crocket/NanumBarunGothicYetHanGul-2014-TTF.zip
	mirror://crocket/NanumBarunPen-2014-OTF.zip
	mirror://crocket/NanumBarunPen-2014-TTF.zip
	mirror://crocket/NanumGothic-2016-OTF.zip
	mirror://crocket/NanumGothic-2016-TTF.zip
	mirror://crocket/NanumGothicCoding-2.5.zip
	mirror://crocket/NanumGothicEco-2011-OTF.zip
	mirror://crocket/NanumGothicEco-2011-TTF.zip
	mirror://crocket/NanumMyeongJo-2014-OTF.zip
	mirror://crocket/NanumMyeongJo-2014-TTF.zip
	mirror://crocket/NanumMyeongJoEco-2011-OTF.zip
	mirror://crocket/NanumMyeongJoEco-2011-TTF.zip
	mirror://crocket/NanumMyeongJoYetHanGul-2014-OTF.zip
	mirror://crocket/NanumMyeongJoYetHanGul-2014-TTF.zip
	mirror://crocket/NanumSonGeulSsi-2010-OTF.zip
	mirror://crocket/NanumSonGeulSsi-2010-TTF.zip
	mirror://crocket/NanumSquare-2017-OTF.zip
	mirror://crocket/NanumSquare-2017-TTF.zip
	mirror://crocket/NanumSquareRound-2017-OTF.zip
	mirror://crocket/NanumSquareRound-2017-TTF.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND=""
RDEPEND=""

FONT_SUFFIX="otf ttf"
S="${WORKDIR}"

src_prepare() {
	rm -r __MACOSX || die
	eapply_user
}
