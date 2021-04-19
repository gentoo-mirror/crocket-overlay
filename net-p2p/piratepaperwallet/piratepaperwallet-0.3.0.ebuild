# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
autocfg-1.0.1
typenum-1.13.0
libc-0.2.93
byteorder-1.4.3
proc-macro2-0.4.30
unicode-xid-0.1.0
cfg-if-1.0.0
lazy_static-1.4.0
constant_time_eq-0.1.5
encoding_index_tests-0.1.4
nodrop-0.1.14
crc32fast-1.2.1
byte-tools-0.2.0
byte-tools-0.3.1
rayon-core-1.9.0
bitflags-1.2.1
syn-0.15.44
scopeguard-1.1.0
arrayref-0.3.6
lzw-0.10.0
adler32-1.2.0
num-derive-0.2.5
opaque-debug-0.1.1
opaque-debug-0.2.3
adler-1.0.2
fake-simd-0.1.2
arrayvec-0.5.2
log-0.4.14
futures-0.1.31
fuchsia-cprng-0.1.1
color_quant-1.1.0
either-1.6.1
bit-vec-0.4.4
crossbeam-0.3.2
linked-hash-map-0.3.0
pom-3.2.0
dtoa-0.4.8
rand_core-0.3.1
rand_core-0.4.2
itoa-0.3.4
crypto_api-0.2.2
jpeg-decoder-0.1.22
checked_int_cast-1.0.0
unicode-width-0.1.8
hex-0.3.2
bech32-0.6.0
strsim-0.8.0
base58-0.1.0
vec_map-0.8.2
ansi_term-0.11.0
json-0.11.15
encoding-index-tradchinese-1.20141219.5
encoding-index-singlebyte-1.20141219.5
encoding-index-korean-1.20141219.5
encoding-index-japanese-1.20141219.5
encoding-index-simpchinese-1.20141219.5
stb_truetype-0.3.1
block-padding-0.1.5
inflate-0.4.5
deflate-0.7.20
num-traits-0.2.14
num-integer-0.1.44
num-bigint-0.2.6
crossbeam-utils-0.8.3
memoffset-0.6.3
miniz_oxide-0.4.4
num-rational-0.2.4
rayon-1.5.0
rdrand-0.4.0
num-iter-0.1.42
gif-0.10.3
blake2b_simd-0.5.11
blake2s_simd-0.5.11
crypto_api_chachapoly-0.1.8
qrcode-0.8.0
textwrap-0.11.0
encoding-0.2.33
num_cpus-1.13.0
rand-0.4.6
time-0.1.44
rand-0.5.6
atty-0.2.14
quote-0.6.13
png-0.15.3
futures-cpupool-0.1.8
generic-array-0.8.4
generic-array-0.9.1
generic-array-0.12.4
clap-2.33.3
cloudabi-0.0.3
syn-0.14.9
ordered-float-1.1.1
approx-0.3.2
crossbeam-epoch-0.9.3
crossbeam-channel-0.5.1
digest-0.6.2
digest-0.7.6
digest-0.8.1
crypto-mac-0.4.0
block-buffer-0.2.0
block-cipher-trait-0.5.3
flate2-1.0.20
block-buffer-0.7.3
rusttype-0.8.3
crossbeam-deque-0.8.0
hermit-abi-0.1.18
hmac-0.4.2
aes-soft-0.2.0
aesni-0.4.1
sha2-0.6.0
sha2-0.8.2
ripemd160-0.8.0
rusttype-0.7.9
hmac-drbg-0.1.2
aes-0.2.0
libsecp256k1-0.2.2
fpe-0.1.0
tiff-0.3.1
image-0.22.5
lopdf-0.23.0
printpdf-0.2.12
stream-cipher-0.1.1
wasi-0.10.0+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="a Pirate Sapling paper wallet generator that can run completely offline"
HOMEPAGE="https://github.com/PirateNetwork/piratepaperwallet"

LIBRUSTZCASH="5a48d179b8434a0318e7e19dda506e245a904092"
LIBRUSTZCASH_P="librustzcash-${LIBRUSTZCASH}"
SRC_URI="https://github.com/PirateNetwork/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/zcash/librustzcash/archive/${LIBRUSTZCASH}.tar.gz -> ${LIBRUSTZCASH_P}.tar.gz
	$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD CC0-1.0 ISC MIT Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND=""

DOCS="README.md"
PATCHES="${FILESDIR}/piratepaperwallet-0.3.0.patch"

src_prepare() {
	default

	cd "${WORKDIR}/librustzcash-${LIBRUSTZCASH}"
	mv ff/ff_derive "${ECARGO_VENDOR}/ff_derive-0.3.0"
	mv ff "${ECARGO_VENDOR}/ff-0.4.0"
	mv group "${ECARGO_VENDOR}/group-0.1.0"
	mv pairing "${ECARGO_VENDOR}/pairing-0.14.2"
	mv bellman "${ECARGO_VENDOR}/bellman-0.1.0"
	mv sapling-crypto "${ECARGO_VENDOR}/sapling-crypto-0.0.1"
	mv zcash_primitives "${ECARGO_VENDOR}/zcash_primitives-0.0.0"

	librustzcash_pkgs=("ff_derive-0.3.0" "ff-0.4.0" "group-0.1.0"
					   "pairing-0.14.2" "bellman-0.1.0" "sapling-crypto-0.0.1"
					   "zcash_primitives-0.0.0")
	for pkg in "${librustzcash_pkgs[@]}"
	do
		cd "${ECARGO_VENDOR}"
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

src_compile() {
	cd cli
	cargo_src_compile
}

src_install() {
	cd cli
	cargo_src_install
}

src_test() {
	cd cli
	cargo_src_test
}
