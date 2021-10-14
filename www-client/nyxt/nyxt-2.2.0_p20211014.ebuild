# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

EGIT_REPO_URI="https://github.com/atlas-engineer/nyxt.git"
EGIT_COMMIT="c15c0782d76f1f62b64976deb619a8ff65526160"
KEYWORDS="~amd64"

DESCRIPTION="Nyxt - the internet on your terms."
HOMEPAGE="https://nyxt.atlas.engineer/"
LICENSE="BSD CC-BY-SA-3.0"
SLOT="0"
IUSE="X spell"

DEPEND="net-libs/webkit-gtk
	dev-libs/gobject-introspection
	net-libs/glib-networking
	gnome-base/gsettings-desktop-schemas
	sys-libs/libfixposix
	X? ( x11-misc/xclip )
	spell? ( app-text/enchant )"
BDEPEND=">=dev-lisp/sbcl-2.0.0"
RESTRICT="primaryuri"

src_compile(){
	env PREFIX=/usr emake all || die emake failed
}

src_install() {
	env PREFIX=/usr DESTDIR="${D}" emake install
	einstalldocs
}
