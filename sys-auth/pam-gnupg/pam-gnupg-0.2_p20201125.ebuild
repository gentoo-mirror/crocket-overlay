# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools pam

DESCRIPTION="Unlock GnuPG keys on login"
HOMEPAGE="https://github.com/cruegge/pam-gnupg"
COMMIT="99f1c2a3f903276c03a13692f50c292aa4b7bd37"
SRC_URI="https://github.com/cruegge/pam-gnupg/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	app-crypt/gnupg
	sys-libs/pam
"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}-${COMMIT}"

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf --prefix=/usr --with-moduledir=$(getpam_mod_dir)
}

pkg_postinst() {
	einfo
	einfo "To enable pam-gnupg you must put the lines:"
	einfo "'auth    optional pam_gnupg.so' and"
	einfo "'session optional pam_gnupg.so' into one of these files."
	einfo
	einfo "/etc/pam.d/lightdm, /etc/pam.d/lxdm, /etc/pam.d/sddm, etc."
	einfo
	einfo "For tty login use the file: /etc/pam.d/system-local-login"
	einfo
	einfo "See <https://github.com/cruegge/pam-gnupg#usage>"
	einfo "for more detailed usage instructions."
	einfo
}
