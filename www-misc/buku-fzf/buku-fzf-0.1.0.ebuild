# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit janet-executable

DESCRIPTION="A buku bookmark browser"
HOMEPAGE="https://github.com/crocket/buku-fzf"
SRC_URI="https://github.com/crocket/buku-fzf/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND=">=dev-janet/argparse-0_pre20201201
	>=dev-janet/sh-0_alpha20200513"

DOCS="README.adoc"
