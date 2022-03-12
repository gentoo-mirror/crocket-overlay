# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: rakudo
# @MAINTAINER: crocket <748856+crocket@users.noreply.github.com>
# @BLURB: An eclass for raku modules

EXPORT_FUNCTIONS src_install pkg_setup

DEPEND="dev-lang/rakudo:="
RDEPEND="dev-lang/rakudo:="

# @FUNCTION: rakudo_get_repo
# @USAGE: <core|vendor|site>
# @RETURN: Path to a raku repository
# @INTERNAL
rakudo_get_repo() {
	func="CompUnit::RepositoryRegistry.repository-for-name"
	repo=$(raku -e "say $func('$1')")
	echo ${repo#inst#}
}

# @ECLASS-VARIABLE: rakudo_vendor
# @DESCRIPTION: Path to raku vendor repository
# @INTERNAL
rakudo_vendor=

# @FUNCTION: rakudo_bin_symlink
# @USAGE: <executable-in-$rakudo_vendor/bin>
# @DESCRIPTION: Make a symlink to $rakudo_vendor/bin/executable in /usr/bin
rakudo_symlink_bin() {
	dosym "$rakudo_vendor/bin/$1" "/usr/bin/$1"
}

rakudo_pkg_setup() {
	rakudo_vendor=$(rakudo_get_repo vendor)
}

rakudo_src_install() {
	install="$(rakudo_get_repo core)/tools/install-dist.raku"
	env RAKUDO_RERESOLVE_DEPENDENCIES=0 \
		$install --to="${D}$rakudo_vendor" --for=vendor --from=.
}
