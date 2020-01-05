# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: janet-module
# @MAINTAINER:
# crocket <748856+crocket@users.noreply.github.com>
# @BLURB: An eclass for building and installing janet projects with jpm

EXPORT_FUNCTIONS src_compile src_install

DEPEND=">=dev-lang/janet-1.6.0"
RDEPEND=">=dev-lang/janet-1.6.0"

# @FUNCTION: get_janet_path
# @DESCRIPTION: Get JANET_PATH for installation
get_janet_path() {
	echo "${D}$(janet -e '(print (dyn :syspath))')"
}

# @FUNCTION: ejpm
# @USAGE: <arguments to jpm>
# @DESCRIPTION: Call jpm with JANET_PATH inside installation directory
ejpm() {
	env JANET_PATH="$(get_janet_path)" jpm "$@"
}

janet-module_src_compile() {
	ejpm build
}

janet-module_src_install() {
	mkdir -p "$(get_janet_path)"
	ejpm install
	einstalldocs
}
