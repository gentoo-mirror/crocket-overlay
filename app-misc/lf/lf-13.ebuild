# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="a terminal file manager written in Go"
HOMEPAGE="https://github.com/gokcehan/lf"
EGO_VENDOR=(
	"github.com/mattn/go-runewidth v0.0.4"
	"github.com/nsf/termbox-go 288510b9734e30e7966ec2f22b87c5f8e67345e3"
)
SRC_URI="https://github.com/gokcehan/lf/archive/r${PV}.tar.gz -> ${P}.tar.gz
	$(go-module_vendor_uris)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND=""
S="${WORKDIR}/${PN}-r${PV}"
DOCS="LICENSE README.md etc/lfrc.example"

src_compile() {
	go build || die
}

src_install() {
	dobin lf
	einstalldocs

	insinto /usr/share/${PN}
	doins etc/lfcd.sh
	doman lf.1

	# fish
	insinto /usr/share/fish/vendor_completions.d
	doins etc/lf.fish
	insinto /usr/share/fish/vendor_functions.d
	doins etc/lfcd.fish
}
