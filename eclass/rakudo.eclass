# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: rakudo
# @MAINTAINER: crocket <748856+crocket@users.noreply.github.com>
# @BLURB: An eclass for raku modules

EXPORT_FUNCTIONS src_compile src_install src_test pkg_setup

# @ECLASS-VARIABLE: rakudo_do_not_run_tests
# @DESCRIPTION:
# Set this to true above `inherit rakudo` for packages that shouldn't run tests with
# dev-raku/App-Prove6.
rakudo_do_not_run_tests=${rakudo_do_not_run_tests:-false}

if [ "$rakudo_do_not_run_tests" == true ]; then
	BDEPEND="dev-lang/rakudo:="
else
	BDEPEND="dev-lang/rakudo:=
		test? ( dev-raku/App-Prove6 )"
	IUSE="test"
fi
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

# @ECLASS-VARIABLE: rakudo_install
# @DESCRIPTION: Path to install-dist.raku
# @INTERNAL
rakudo_install=

# @ECLASS-VARIABLE: rakudo_vendor
# @DESCRIPTION: Path to raku vendor repository
# @INTERNAL
rakudo_vendor=

# @FUNCTION: rakudo_bin_symlink
# @USAGE: <executable-in-$rakudo_vendor/bin>
# @DESCRIPTION: Make a symlink to $rakudo_vendor/bin/executable in /usr/bin
rakudo_symlink_bin() {
	dosym "$rakudo_vendor/bin/$1" "/usr/bin/$1" || die
}

rakudo_pkg_setup() {
	rakudo_vendor="$(rakudo_get_repo vendor)" || die
	rakudo_install="$(rakudo_get_repo core)/tools/install-dist.raku" || die
}

rakudo_src_compile() {
	env RAKUDO_RERESOLVE_DEPENDENCIES=0 \
	$rakudo_install --only-build --from=. || die
}

rakudo_src_install() {
	einstalldocs
	env RAKUDO_RERESOLVE_DEPENDENCIES=0 \
	$rakudo_install --to="${D}$rakudo_vendor" --for=vendor \
	--from=. --build=False || die
}

rakudo_src_test() {
	if [ "$rakudo_do_not_run_tests" == true ]; then
		return
	fi
	prove6 --lib t/ || die
}
