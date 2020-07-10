# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="TUI and CLI for the BitTorrent client Transmission"
HOMEPAGE="https://github.com/rndusr/stig"
SRC_URI="https://github.com/rndusr/stig/archive/v${PV}a0.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	>=dev-python/urwid-2.0
	>=dev-python/urwidtrees-1.0.3
	>=dev-python/aiohttp-3
	<dev-python/aiohttp-4
	dev-python/async_timeout
	dev-python/pyxdg
	dev-python/blinker
	dev-python/natsort
	dev-python/setproctitle
"
DEPEND="
	${RDEPEND}
	test? ( dev-python/asynctest )
"
S="${WORKDIR}/${P}a0"
