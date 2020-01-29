# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )
inherit distutils-r1

DESCRIPTION="Python implementation of routeros api"
HOMEPAGE="https://github.com/luqasz/librouteros"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
