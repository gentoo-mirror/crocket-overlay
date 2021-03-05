# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7,3_8,3_9} )
inherit distutils-r1

DESCRIPTION="A wonderful CLI to track your time!"
HOMEPAGE="https://github.com/TailorDev/Watson"
COMMIT="a7a687c9cf53ae50d50f256729b9732aece574dc"
SRC_URI="https://github.com/TailorDev/Watson/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	>=dev-python/arrow-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	dev-python/click-didyoumean[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
S="${WORKDIR}/Watson-${COMMIT}"
