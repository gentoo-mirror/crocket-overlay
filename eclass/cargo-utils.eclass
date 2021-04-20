# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: cargo-utils
# @MAINTAINER:
# crocket <748856+crocket@users.noreply.github.com>
# @BLURB: A list of helper functions for cargo

# @FUNCTION: cargo-utils_gen_checksum
# @DESCRIPTION: Generate checksums for given packages in ${ECARGO_VENDOR}
cargo-utils_gen_checksum() {
	cd "${ECARGO_VENDOR}"
	einfo "Generating checksums for rust crates"
	for pkg in "$@"
	do
		tar -cf "${pkg}.tar.gz" "${pkg}"
		shasum=$(sha256sum "${pkg}.tar.gz" | cut -d ' ' -f 1)
		cat <<- EOF > ${ECARGO_VENDOR}/${pkg}/.cargo-checksum.json
		{
			"package": "${shasum}",
			"files": {}
		}
		EOF
	done
}
