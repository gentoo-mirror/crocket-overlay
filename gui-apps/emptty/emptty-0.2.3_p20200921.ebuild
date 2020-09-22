# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Dead simple CLI Display Manager on TTY"
HOMEPAGE="https://github.com/tvrzna/emptty"
EGO_SUM=(
	"github.com/bgentry/speakeasy v0.1.0"
	"github.com/bgentry/speakeasy v0.1.0/go.mod"
	"github.com/msteinert/pam v0.0.0-20190215180659-f29b9f28d6f9"
	"github.com/msteinert/pam v0.0.0-20190215180659-f29b9f28d6f9/go.mod"
)
go-module_set_globals

GIT_COMMIT="038c6d713a131e87abbf3dd5b85664c5ec2b4e60"
SRC_URI="https://github.com/tvrzna/emptty/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-libs/pam"
RDEPEND="sys-libs/pam"
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
	sed -i -e 's|/usr/bin/openrc-run|/sbin/openrc-run|' res/openrc-service
	newexe res/openrc-service emptty
	exeinto /etc/sv/emptty
	newexe res/runit-run run
}
