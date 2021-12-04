# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_MAKEFILE_GENERATOR="ninja"
VALA_MIN_API_VERSION="0.34"
inherit cmake vala xdg readme.gentoo-r1

DESCRIPTION="Modern Jabber/XMPP Client using GTK+/Vala"
HOMEPAGE="https://dino.im"

LICENSE="GPL-3"
SLOT="0"
IUSE="+gpg +http +omemo +notification-sound test"
RESTRICT="!test? ( test )
	primaryuri"
KEYWORDS="~amd64"
COMMIT="905f93bcccd26a035cc9d37378b45ff87298adb5"
SRC_URI="https://github.com/dino/dino/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

RDEPEND="
	app-text/gspell[vala]
	dev-db/sqlite:3
	dev-libs/glib:2
	dev-libs/icu
	dev-libs/libgee:0.8
	net-libs/glib-networking
	>=net-libs/libnice-0.1.15
	net-libs/libsignal-protocol-c
	net-libs/libsrtp:2
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/pango
	gpg? ( app-crypt/gpgme:1 )
	http? ( net-libs/libsoup:2.4 )
	omemo? (
		dev-libs/libgcrypt:0
		media-gfx/qrencode
	)
	notification-sound? ( media-libs/libcanberra:0[sound] )
"
DEPEND="
	$(vala_depend)
	${RDEPEND}
	media-libs/gst-plugins-base
	media-libs/gstreamer
	sys-devel/gettext
"
S="${WORKDIR}/${PN}-${COMMIT}"

src_prepare() {
	cmake_src_prepare
	vala_src_prepare
}

src_configure() {
	local disabled_plugins=(
		$(usex gpg "" "openpgp")
		$(usex omemo "" "omemo")
		$(usex http  "" "http-files")
	)
	local enabled_plugins=(
		$(usex notification-sound "notification-sound" "")
	)
	local mycmakeargs+=(
		"-DENABLED_PLUGINS=$(local IFS=";"; echo "${enabled_plugins[*]}")"
		"-DDISABLED_PLUGINS=$(local IFS=";"; echo "${disabled_plugins[*]}")"
		"-DVALA_EXECUTABLE=${VALAC}"
		"-DBUILD_TESTS=$(usex test)"
	)

	cmake_src_configure
}

src_test() {
	"${BUILD_DIR}"/xmpp-vala-test || die
}

src_install() {
	cmake_src_install
	readme.gentoo_create_doc
}

src_postinst() {
	xdg_pkg_postinst
	readme.gentoo_print_elog
}
