# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CARGO_OPTIONAL="true"

inherit cargo multilib cargo-utils qmake-utils

CRATES="
addchain-0.1.0
addr2line-0.12.2
adler32-1.1.0
adler-0.2.2
aes-soft-0.3.3
aesni-0.6.0
aes-0.3.2
antidote-1.0.0
anyhow-1.0.31
arc-swap-0.3.11
arc-swap-0.4.7
arrayref-0.3.6
arrayvec-0.5.1
async-stream-impl-0.2.1
async-stream-0.2.1
async-trait-0.1.36
autocfg-0.1.7
autocfg-1.0.0
backtrace-0.3.49
base58-0.1.0
base64-0.11.0
base64-0.12.3
bech32-0.7.2
bitflags-1.2.1
bit-vec-0.4.4
blake2b_simd-0.5.10
blake2s_simd-0.5.10
block-buffer-0.7.3
block-cipher-trait-0.6.2
block-padding-0.1.5
bs58-0.2.5
bumpalo-3.4.0
byteorder-1.3.4
bytes-0.4.12
bytes-0.5.5
byte-tools-0.3.1
cc-1.0.57
cfg-if-0.1.10
chrono-0.4.13
cloudabi-0.0.3
constant_time_eq-0.1.5
core-foundation-0.7.0
core-foundation-sys-0.7.0
crc32fast-1.2.0
crossbeam-channel-0.4.4
crossbeam-deque-0.7.3
crossbeam-epoch-0.8.2
crossbeam-queue-0.2.3
crossbeam-utils-0.7.2
crossbeam-0.7.3
crypto_api_chachapoly-0.2.2
crypto_api-0.2.2
crypto-mac-0.7.0
digest-0.8.1
dirs-sys-0.3.5
dirs-2.0.2
dtoa-0.4.6
either-1.5.3
encoding_rs-0.8.24
failure_derive-0.1.8
failure-0.1.8
fake-simd-0.1.2
filetime-0.2.10
fixedbitset-0.2.0
flate2-1.0.16
fnv-1.0.7
foreign-types-shared-0.1.1
foreign-types-0.3.2
fpe-0.2.0
fuchsia-cprng-0.1.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-channel-0.3.5
futures-core-0.3.5
futures-cpupool-0.1.8
futures-io-0.3.7
futures-sink-0.3.5
futures-task-0.3.5
futures-util-0.3.5
futures-0.1.29
generator-0.6.21
generic-array-0.12.3
getrandom-0.1.14
gimli-0.21.0
h2-0.2.5
hashbrown-0.1.8
heck-0.3.1
hermit-abi-0.1.15
hex-0.3.2
hmac-0.7.1
httparse-1.3.4
http-body-0.3.1
http-0.2.1
humantime-1.3.0
hyper-tls-0.4.3
hyper-0.13.6
idna-0.2.0
indexmap-1.4.0
iovec-0.1.4
ipnet-2.3.0
itertools-0.8.2
itoa-0.4.6
js-sys-0.3.41
json-0.12.4
kernel32-sys-0.2.2
lazy_static-1.4.0
libc-0.2.71
libflate-0.1.27
libsodium-sys-0.2.5
linked-hash-map-0.5.3
lock_api-0.1.5
log4rs-0.8.3
log-mdc-0.1.0
log-0.4.8
loom-0.3.4
matches-0.1.8
maybe-uninit-2.0.0
memchr-2.3.3
memoffset-0.5.6
mime_guess-2.0.3
mime-0.3.16
miniz_oxide-0.3.7
miniz_oxide-0.4.0
mio-uds-0.6.8
mio-0.6.22
mio-named-pipes-0.1.7
miow-0.2.1
miow-0.3.5
multimap-0.8.1
native-tls-0.2.4
net2-0.2.34
num-bigint-0.2.6
num_cpus-1.13.0
num-integer-0.1.43
num-traits-0.2.12
object-0.20.0
once_cell-0.1.8
once_cell-1.4.0
opaque-debug-0.2.3
openssl-probe-0.1.2
openssl-sys-0.9.58
openssl-0.10.30
ordered-float-1.1.0
parking_lot_core-0.4.0
parking_lot-0.7.1
pbkdf2-0.3.0
percent-encoding-2.1.0
petgraph-0.5.1
pin-project-internal-0.4.22
pin-project-lite-0.1.7
pin-project-0.4.22
pin-utils-0.1.0
pkg-config-0.3.17
ppv-lite86-0.2.8
proc-macro2-1.0.18
prost-build-0.6.1
prost-derive-0.6.1
prost-types-0.6.1
prost-0.6.1
protobuf-codegen-pure-2.14.0
protobuf-codegen-2.14.0
protobuf-2.14.0
quick-error-1.2.3
quote-1.0.7
rand_chacha-0.1.1
rand_chacha-0.2.2
rand_core-0.3.1
rand_core-0.4.2
rand_core-0.5.1
rand_hc-0.1.0
rand_hc-0.2.0
rand_isaac-0.1.1
rand_jitter-0.1.4
rand_os-0.1.3
rand_pcg-0.1.2
rand_pcg-0.2.1
rand-0.6.5
rand-0.7.3
rand_xorshift-0.1.1
rand_xorshift-0.2.0
rdrand-0.4.0
redox_syscall-0.1.56
redox_users-0.3.4
remove_dir_all-0.5.3
reqwest-0.10.8
ring-0.16.15
ripemd160-0.8.0
rle-decode-fast-1.0.1
rust-argon2-0.7.0
rustc-demangle-0.1.16
rustc_version-0.2.3
rust-embed-impl-5.5.1
rust-embed-utils-5.0.0
rust-embed-5.5.1
rustls-native-certs-0.3.0
rustls-0.17.0
ryu-1.0.5
same-file-1.0.6
schannel-0.1.19
scoped-tls-0.1.2
scopeguard-0.3.3
scopeguard-1.1.0
sct-0.6.0
secp256k1-0.15.0
security-framework-0.4.4
security-framework-sys-0.4.3
semver-parser-0.7.0
semver-0.9.0
serde_derive-1.0.114
serde_json-1.0.56
serde_urlencoded-0.6.1
serde-1.0.114
serde-value-0.5.3
serde_yaml-0.8.13
sha2-0.8.2
signal-hook-registry-1.2.0
slab-0.4.2
smallvec-0.6.13
socket2-0.3.12
sodiumoxide-0.2.5
spin-0.5.2
subtle-1.0.0
subtle-2.2.3
synstructure-0.12.4
syn-1.0.33
take_mut-0.2.2
tar-0.4.29
tempfile-3.1.0
thread-id-3.3.0
threadpool-1.8.1
time-0.1.43
tiny-bip39-0.6.2
tinyvec-0.3.4
tokio-macros-0.2.5
tokio-rustls-0.13.1
tokio-tls-0.3.1
tokio-util-0.3.1
tokio-0.2.21
tonic-build-0.1.1
tonic-0.2.1
tower-balance-0.3.0
tower-buffer-0.3.0
tower-discover-0.3.0
tower-layer-0.3.0
tower-limit-0.3.1
tower-load-shed-0.3.0
tower-load-0.3.0
tower-make-0.3.0
tower-ready-cache-0.3.1
tower-retry-0.3.0
tower-service-0.3.0
tower-timeout-0.3.0
tower-util-0.3.1
tower-0.3.1
tracing-attributes-0.1.8
tracing-core-0.1.10
tracing-futures-0.2.4
tracing-0.1.15
traitobject-0.1.0
try-lock-0.2.2
typemap-0.3.3
typenum-1.12.0
unicase-2.6.0
unicode-bidi-0.3.4
unicode-normalization-0.1.13
unicode-segmentation-1.6.0
unicode-xid-0.2.1
unsafe-any-0.4.2
untrusted-0.7.1
url-2.1.1
vcpkg-0.2.10
version_check-0.9.2
walkdir-2.3.1
want-0.3.0
wasi-0.9.0+wasi-snapshot-preview1
wasm-bindgen-0.2.64
wasm-bindgen-backend-0.2.64
wasm-bindgen-futures-0.4.14
wasm-bindgen-macro-0.2.64
wasm-bindgen-macro-support-0.2.64
wasm-bindgen-shared-0.2.64
web-sys-0.3.41
webpki-roots-0.18.0
webpki-0.21.3
which-3.1.1
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.7.0
ws2_32-sys-0.2.1
xattr-0.2.2
yaml-rust-0.4.4
"

DESCRIPTION="This is z-Addr first, Sapling compatible wallet lightwallet for Pirate."
HOMEPAGE="https://github.com/PirateNetwork/PirateWallet-Lite"
RESTRICT="primaryuri"
LIBRUSTZCASH_PV="2981c4d2860f7cd73282fed885daac0323ff0280"
LIBRUSTZCASH_P="librustzcash-${LIBRUSTZCASH_PV}"
LIGHT_CLI_PV="5a7848381e93d4874375bddc7117efb73678b94e"
LIGHT_CLI_P="piratewallet-light-cli-${LIGHT_CLI_PV}"
SRC_URI="https://github.com/PirateNetwork/PirateWallet-Lite/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/zerocurrencycoin/librustzcash/archive/${LIBRUSTZCASH_PV}.tar.gz -> ${LIBRUSTZCASH_P}.tar.gz
	https://github.com/PirateNetwork/piratewallet-light-cli/archive/${LIGHT_CLI_PV}.tar.gz -> ${LIGHT_CLI_P}.tar.gz
	$(cargo_crate_uris $CRATES)"
LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD Boost-1.0 CC0-1.0 ISC MIT MPL-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

CDEPEND="dev-qt/qtcore:5
	dev-qt/qtnetwork:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtwebsockets:5
	dev-libs/openssl:="
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"
BDEPEND="dev-libs/libsodium[static-libs]
	|| ( dev-lang/rust[rustfmt] dev-lang/rust-bin[rustfmt] )
	sys-devel/gcc"
S="${WORKDIR}/PirateWallet-Lite-${PV}"
DOCS="README.md"
PATCHES=(
	"${FILESDIR}/piratewallet-lite-1.0.4-libzecwalletlite.patch"
	"${FILESDIR}/piratewallet-lite-1.0.4-qmake.patch"
)

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	default

	rm "${S}/res/libzecwalletlite/Cargo.lock"
	cd "${WORKDIR}/${LIBRUSTZCASH_P}"
	mv bellman "${ECARGO_VENDOR}/bellman-0.6.0"
	mv ff/ff_derive "${ECARGO_VENDOR}/ff_derive-0.6.0"
	mv ff "${ECARGO_VENDOR}/ff-0.6.0"
	mv group "${ECARGO_VENDOR}/group-0.6.0"
	mv pairing "${ECARGO_VENDOR}/pairing-0.16.0"
	mv zcash_client_backend "${ECARGO_VENDOR}/zcash_client_backend-0.2.0"
	mv zcash_primitives "${ECARGO_VENDOR}/zcash_primitives-0.2.0"
	mv zcash_proofs "${ECARGO_VENDOR}/zcash_proofs-0.2.0"
	cd "${WORKDIR}/${LIGHT_CLI_P}"
	mv lib "${ECARGO_VENDOR}/zecwalletlitelib-0.1.0"

	cd "${ECARGO_VENDOR}/zecwalletlitelib-0.1.0"
	eapply "${FILESDIR}/piratewallet-lite-1.0.4-zecwalletlitelib-0.1.0.patch"

	externally_provided_crates=(
		"bellman-0.6.0" "ff_derive-0.6.0" "ff-0.6.0" "group-0.6.0"
		"pairing-0.16.0" "zcash_client_backend-0.2.0" "zcash_primitives-0.2.0"
		"zcash_proofs-0.2.0" "zecwalletlitelib-0.1.0"
	)
	cargo-utils_gen_checksum "${externally_provided_crates[@]}"
}

src_configure() {
	eqmake5 piratewallet-lite.pro
	cargo_src_configure --lib
}

src_compile() {
	cd "${S}/res/libzecwalletlite" || die
	cargo_src_compile || die
	cd "${S}"
	cp res/libzecwalletlite/target/release/libzecwalletlite.a res/ || die
	cp "/usr/$(get_libdir)/libsodium.a" res/ || die
	emake
}

src_install() {
	einstalldocs
	dobin piratewallet-lite
}
