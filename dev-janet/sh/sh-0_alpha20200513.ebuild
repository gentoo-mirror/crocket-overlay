# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit janet-module

DESCRIPTION="A janet module for shell functions."
HOMEPAGE="https://github.com/andrewchambers/janet-process"
GIT_COMMIT="4226a4cae548fde38358aa1fdb6d6a90bf5fe175"
SRC_URI="https://github.com/andrewchambers/janet-sh/archive/${GIT_COMMIT}.tar.gz -> janet-${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=">=dev-janet/posix-spawn-0_alpha20200512"
S="${WORKDIR}/janet-${PN}-${GIT_COMMIT}"
DOCS="README.md"
