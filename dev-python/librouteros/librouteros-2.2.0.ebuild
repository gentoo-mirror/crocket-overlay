# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python{3_4,3_5,3_6} )
inherit distutils-r1

DESCRIPTION="Python implementation of routeros api"
HOMEPAGE="https://github.com/luqasz/librouteros"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
