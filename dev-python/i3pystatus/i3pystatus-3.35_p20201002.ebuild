# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="A complete replacement for i3status with many status modules"
HOMEPAGE="https://github.com/enkore/i3pystatus"
GIT_COMMIT="992fb8cecb10a92b79c3342deec2bad05b42d927"
SRC_URI="https://github.com/enkore/i3pystatus/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${GIT_COMMIT}"
LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DEPEND=""
RDEPEND=""
