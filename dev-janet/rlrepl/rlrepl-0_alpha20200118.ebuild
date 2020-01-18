# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit janet-module

DESCRIPTION="A janet REPL using readline."
HOMEPAGE="https://github.com/andrewchambers/janet-rlrepl"
GIT_COMMIT="046fbcd1b7e8b290203a04d88e90cee9a7e0e2b5"
SRC_URI="https://github.com/andrewchambers/janet-rlrepl/archive/${GIT_COMMIT}.tar.gz -> janet-${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-libs/readline"
RDEPEND="sys-libs/readline"
S="${WORKDIR}/janet-${PN}-${GIT_COMMIT}"
DOCS="README.md"
