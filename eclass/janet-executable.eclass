# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: janet-executable
# @MAINTAINER:
# crocket <748856+crocket@users.noreply.github.com>
# @BLURB: An eclass for building and installing janet executables with jpm

inherit janet-functions

EXPORT_FUNCTIONS src_compile src_install

BDEPEND="dev-lang/janet"

janet-executable_src_compile() {
	ejpm build || die
}

janet-executable_src_install() {
	mkdir -p "$(janet-module_janet_path)"
	ejpm install || die
	einstalldocs
}
