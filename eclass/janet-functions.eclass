# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: janet-functions
# @MAINTAINER:
# crocket <748856+crocket@users.noreply.github.com>
# @BLURB: An eclass for janet helper functions

# @FUNCTION: janet-module_janet_path
# @DESCRIPTION: Get JANET_PATH for installation
janet-module_janet_path() {
	echo "${D}$(janet -e '(print (dyn :syspath))')"
}

# @FUNCTION: ejpm
# @USAGE: <arguments to jpm>
# @DESCRIPTION: Call jpm with various paths set appropriately.
ejpm() {
	jpm --modpath="$(janet-module_janet_path)" \
		--binpath="${D}/usr/bin" "$@"
}
