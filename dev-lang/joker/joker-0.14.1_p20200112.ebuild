# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="a small Clojure interpreter and linter written in Go."
HOMEPAGE="https://joker-lang.org/"
EGO_VENDOR=(
	"github.com/chzyer/readline 2972be24d48e78746da79ba8e24e8b488c9880de"
	"github.com/pkg/profile v1.2.1"
	"gopkg.in/yaml.v2 v2.2.2 github.com/go-yaml/yaml"
)
GIT_COMMIT="41153d890f0f4c62f2031edc9b6d818a6e039b56"
SRC_URI="https://github.com/candid82/joker/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz
	$(go-module_vendor_uris)"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-lang/go"
RDEPEND=""
DOCS=( DEVELOPER.md LIBRARIES.md README.md docs/misc/lib-loader.md )
HTML_DOCS="docs/*.html docs/*.css"
S="${WORKDIR}/${PN}-${GIT_COMMIT}"

src_compile() {
	go generate ./... || die
	go vet ./... || die
	go build || die
}

src_install() {
	einstalldocs
	dobin joker
}
