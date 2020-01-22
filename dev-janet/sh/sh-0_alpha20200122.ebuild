# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit janet-module

DESCRIPTION="A janet module for shell functions."
HOMEPAGE="https://github.com/andrewchambers/janet-process"
GIT_COMMIT="e46e55ca62b5f8239e28b130fb12ec3c52699f7b"
SRC_URI="https://github.com/andrewchambers/janet-sh/archive/${GIT_COMMIT}.tar.gz -> janet-${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=">=dev-janet/process-0_alpha20200103"
S="${WORKDIR}/janet-${PN}-${GIT_COMMIT}"
DOCS="README.md"
