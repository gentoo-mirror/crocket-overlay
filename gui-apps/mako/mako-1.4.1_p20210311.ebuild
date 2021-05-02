# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A lightweight notification daemon for Wayland. Works on Sway."
HOMEPAGE="https://github.com/emersion/mako"
COMMIT="e5b5d56aaaf8390c97a17c208f950803538e7294"
SRC_URI="https://github.com/emersion/mako/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"
IUSE="+icons"

DEPEND="
	dev-libs/wayland
	x11-libs/pango
	x11-libs/cairo
	|| (
		sys-apps/systemd
		sys-auth/elogind
		sys-libs/basu
	)
	sys-apps/dbus[user-session]
	icons? (
		x11-libs/gdk-pixbuf
	)
"
RDEPEND="
	${DEPEND}
	dev-libs/wayland-protocols
"
BDEPEND="
	virtual/pkgconfig
	>=app-text/scdoc-1.9.7
"
S="${WORKDIR}/${PN}-${COMMIT}"

src_configure() {
	local emesonargs=(
		-Dicons=$(usex icons enabled disabled)
		"-Dwerror=false"
	)
	meson_src_configure
}
