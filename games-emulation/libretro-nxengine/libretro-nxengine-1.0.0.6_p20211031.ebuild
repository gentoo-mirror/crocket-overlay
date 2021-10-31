# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/nxengine-libretro"
LIBRETRO_COMMIT_SHA="7a56a9e9b79f91389731567f7858062b8335ff23"

inherit libretro-core

DESCRIPTION="libretro implementation of NXEngine. (Cave Story)"
HOMEPAGE="https://github.com/libretro/nxengine-libretro"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
	games-emulation/libretro-info"

pkg_postinst() {
	if [[ "${first_install}" == "1" ]]; then
		elog ""
		elog "To play a game, like Cave Story, put the gamefiles"
		elog "in your rgui_browser_directory and load Doukutsu.exe"
		elog "Or, scan the game directory in retroarch."
		ewarn ""
	fi
}
