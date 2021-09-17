# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Dead simple CLI Display Manager on TTY"
HOMEPAGE="https://github.com/tvrzna/emptty"
EGO_SUM=(
	"github.com/msteinert/pam v0.0.0-20200810204841-913b8f8cdf8b"
	"github.com/msteinert/pam v0.0.0-20200810204841-913b8f8cdf8b/go.mod"
)
go-module_set_globals
GIT_COMMIT="22b770a8b9424640259acf4eeb83b1435db10d2f"
SRC_URI="https://github.com/tvrzna/emptty/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="primaryuri"
DEPEND="sys-libs/pam
	x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.14"
DOCS="README.md SAMPLES.md res/conf"
S="${WORKDIR}/${PN}-${GIT_COMMIT}"

src_compile() {
	go build || die
}

src_install() {
	dobin emptty
	einstalldocs
	doman res/emptty.1

	insinto /etc/pam.d
	newins res/pam emptty
	insinto /usr/lib/systemd/system
	newins res/systemd-service emptty.service
	exeinto /etc/init.d
	newexe res/openrc-service emptty
}
