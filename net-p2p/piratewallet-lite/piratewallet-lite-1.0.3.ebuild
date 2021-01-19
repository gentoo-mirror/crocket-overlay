# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CARGO_OPTIONAL="true"

inherit cargo

CRATES="libc-0.2.65
lazy_static-1.4.0
adler32-1.0.4
aes-0.3.2
aes-soft-0.3.3
aesni-0.6.0
antidote-1.0.0
arc-swap-0.3.11
arrayref-0.3.5
arrayvec-0.4.12
autocfg-0.1.6
backtrace-0.3.40
backtrace-sys-0.1.32
base58-0.1.0
base64-0.10.1
bech32-0.7.1
bit-vec-0.4.4
bitflags-1.2.1
blake2b_simd-0.5.8
blake2s_simd-0.5.8
block-buffer-0.7.3
block-cipher-trait-0.6.2
block-padding-0.1.4
bs58-0.2.5
byte-tools-0.3.1
byteorder-1.3.2
bytes-0.4.12
c2-chacha-0.2.2
cc-1.0.46
cfg-if-0.1.10
chrono-0.4.9
cloudabi-0.0.3
codegen-0.1.1
constant_time_eq-0.1.4
crc32fast-1.2.0
crossbeam-0.3.2
crossbeam-deque-0.7.1
crossbeam-epoch-0.7.2
crossbeam-queue-0.1.2
crossbeam-utils-0.6.6
crypto-mac-0.7.0
crypto_api-0.2.2
crypto_api_chachapoly-0.2.2
digest-0.8.1
dirs-2.0.2
dirs-sys-0.3.4
dtoa-0.4.4
either-1.5.3
failure-0.1.6
failure_derive-0.1.6
fake-simd-0.1.2
filetime-0.2.7
fixedbitset-0.1.9
flate2-1.0.12
fnv-1.0.6
fpe-0.2.0
fuchsia-cprng-0.1.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.1.29
futures-cpupool-0.1.8
generic-array-0.12.3
getrandom-0.1.12
h2-0.1.26
hashbrown-0.1.8
heck-0.3.1
hex-0.3.2
hmac-0.7.1
http-0.1.19
http-body-0.1.0
http-connection-0.1.0
humantime-1.3.0
indexmap-1.2.0
iovec-0.1.4
itertools-0.8.0
itoa-0.4.4
json-0.12.0
kernel32-sys-0.2.2
libflate-0.1.27
libsodium-sys-0.2.5
linked-hash-map-0.5.2
lock_api-0.1.5
lock_api-0.3.1
log-0.4.8
log-mdc-0.1.0
log4rs-0.8.3
memoffset-0.5.1
miniz_oxide-0.3.3
mio-0.6.19
mio-uds-0.6.7
miow-0.2.1
multimap-0.4.0
net2-0.2.33
nodrop-0.1.14
num-bigint-0.2.3
num-integer-0.1.41
num-traits-0.2.8
num_cpus-1.10.1
once_cell-0.1.8
opaque-debug-0.2.3
ordered-float-1.0.2
parking_lot-0.7.1
parking_lot-0.9.0
parking_lot_core-0.4.0
parking_lot_core-0.6.2
pbkdf2-0.3.0
percent-encoding-1.0.1
petgraph-0.4.13
pkg-config-0.3.16
ppv-lite86-0.2.5
proc-macro2-0.4.30
proc-macro2-1.0.5
prost-0.5.0
prost-build-0.5.0
prost-derive-0.5.0
prost-types-0.5.0
protobuf-2.8.1
protobuf-codegen-2.8.1
protobuf-codegen-pure-2.8.1
quick-error-1.2.2
quote-0.3.15
quote-0.6.13
quote-1.0.2
rand-0.6.5
rand-0.7.2
rand_chacha-0.1.1
rand_chacha-0.2.1
rand_core-0.3.1
rand_core-0.4.2
rand_core-0.5.1
rand_hc-0.1.0
rand_hc-0.2.0
rand_isaac-0.1.1
rand_jitter-0.1.4
rand_os-0.1.3
rand_os-0.2.2
rand_pcg-0.1.2
rand_xorshift-0.1.1
rand_xorshift-0.2.0
rdrand-0.4.0
redox_syscall-0.1.56
redox_users-0.3.1
remove_dir_all-0.5.2
ring-0.14.6
ripemd160-0.8.0
rle-decode-fast-1.0.1
rust-argon2-0.5.1
rust-embed-5.1.0
rust-embed-impl-5.1.0
rust-embed-utils-5.0.0
rustc-demangle-0.1.16
rustc_version-0.2.3
rustls-0.15.2
ryu-1.0.2
same-file-1.0.5
scopeguard-0.3.3
scopeguard-1.0.0
sct-0.5.0
secp256k1-0.15.0
semver-0.9.0
semver-parser-0.7.0
serde-1.0.101
serde-value-0.5.3
serde_derive-1.0.101
serde_json-1.0.41
serde_yaml-0.8.11
sha2-0.8.0
slab-0.4.2
smallvec-0.6.10
sodiumoxide-0.2.5
spin-0.5.2
string-0.2.1
subtle-1.0.0
subtle-2.2.1
syn-0.11.11
syn-0.14.9
syn-0.15.44
syn-1.0.5
synom-0.11.3
synstructure-0.12.1
take_mut-0.2.2
tar-0.4.26
tempfile-3.1.0
thread-id-3.3.0
time-0.1.42
tiny-bip39-0.6.2
tokio-0.1.22
tokio-buf-0.1.1
tokio-codec-0.1.1
tokio-current-thread-0.1.6
tokio-executor-0.1.8
tokio-fs-0.1.6
tokio-io-0.1.12
tokio-reactor-0.1.10
tokio-rustls-0.10.0-alpha.4
tokio-sync-0.1.7
tokio-tcp-0.1.3
tokio-threadpool-0.1.16
tokio-timer-0.2.11
tokio-udp-0.1.5
tokio-uds-0.2.5
tower-buffer-0.1.2
tower-discover-0.1.0
tower-grpc-0.1.1
tower-layer-0.1.0
tower-limit-0.1.1
tower-load-shed-0.1.0
tower-request-modifier-0.1.0
tower-retry-0.1.0
tower-service-0.2.0
tower-timeout-0.1.1
tower-util-0.1.0
tracing-0.1.9
tracing-attributes-0.1.4
tracing-core-0.1.6
traitobject-0.1.0
typemap-0.3.3
typenum-1.11.2
unicode-segmentation-1.3.0
unicode-xid-0.0.4
unicode-xid-0.1.0
unicode-xid-0.2.0
unsafe-any-0.4.2
untrusted-0.6.2
vcpkg-0.2.7
walkdir-2.2.9
wasi-0.7.0
webpki-0.19.1
webpki-roots-0.16.0
which-2.0.1
winapi-0.2.8
winapi-0.3.8
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.2
winapi-x86_64-pc-windows-gnu-0.4.0
ws2_32-sys-0.2.1
xattr-0.2.2
yaml-rust-0.4.3"

DESCRIPTION="This is z-Addr first, Sapling compatible wallet lightwallet for Pirate."
HOMEPAGE="https://github.com/MrMLynch/PirateWallet-Lite"
RESTRICT="primaryuri"
SRC_URI="https://github.com/MrMLynch/PirateWallet-Lite/archive/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris $CRATES)
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/arrrwalletlitelib-0.1.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/bellman-0.1.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/ff-0.4.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/ff_derive-0.3.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/group-0.1.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/pairing-0.14.2.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/zcash_client_backend-0.0.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/zcash_primitives-0.0.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/zcash_proofs-0.0.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/tokio-connect-0.1.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/tower-0.1.1.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/tower-grpc-build-0.1.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/tower-h2-0.1.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/tower-http-0.1.0.crate
	https://github.com/crocket/crocket-overlay-distfiles/raw/master/piratewallet-lite/tower-http-util-0.1.0.crate"
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD BSL-1.0 CC0-1.0 ISC MIT MPL-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

CDEPEND="dev-qt/qtcore
	dev-qt/qtnetwork
	dev-qt/qtgui
	dev-qt/qtwidgets
	dev-qt/qtwebsockets"
DEPEND="${CDEPEND}
	dev-libs/libsodium[static-libs]"
RDEPEND="${CDEPEND}"
BDEPEND=">=virtual/rust-1.37"
S="${WORKDIR}/PirateWallet-Lite-${PV}"
DOCS="README.md"

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	default
	gunzip --stdout "${FILESDIR}/piratewallet-lite-1.0.3.diff.gz" | patch -p1
	cd ${ECARGO_VENDOR}/arrrwalletlitelib-0.1.0
	patch -p1 < "${FILESDIR}/arrrwalletlitelib-0.1.0.diff"
	cd ${ECARGO_VENDOR}/tower-h2-0.1.0
	patch -p1 < "${FILESDIR}/tower-h2-0.1.0.diff"
}

src_configure() {
	qmake piratewallet-lite.pro
	cargo_src_configure --lib
}

src_compile() {
	cd lib
	cargo_src_compile
	cd ..
	cp lib/target/release/libarrrwalletlite.a res/
	cp /usr/lib64/libsodium.a res/
	emake
}

src_install() {
	einstalldocs
	dobin piratewallet-lite
}
