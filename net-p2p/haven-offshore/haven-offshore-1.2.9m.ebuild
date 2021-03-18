# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Haven protocol(XHV) command line wallet"
HOMEPAGE="https://github.com/haven-protocol-org/haven-offshore"
BLOCKCHAIN_EXPLORER_COMMIT="260c527236f25e6d04866ff2deff966e313ffcb3"
SRC_URI="https://github.com/haven-protocol-org/haven-offshore/archive/v1.2.9m.tar.gz -> ${P}.tar.gz
	https://github.com/haven-protocol-org/haven-blockchain-explorer/archive/${BLOCKCHAIN_EXPLORER_COMMIT}.tar.gz -> haven-blockchain-explorer-20201123.tar.gz
	https://github.com/monero-project/monero/archive/v0.16.0.3.tar.gz -> monero-0.16.0.3.tar.gz"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64"
IUSE="lzma unwind +readline ldns xml doc test"

CDEPEND=">=dev-libs/boost-1.75.0:=
	>=net-libs/zeromq-3.0.0:=[pgm]
	dev-libs/libsodium:=
	>=net-dns/unbound-1.4.16:=
	dev-libs/openssl:=
	readline? ( >=sys-libs/readline-6.3.0:= )
	ldns? ( >=net-libs/ldns-1.6.17:= )
	unwind? (
		lzma? ( sys-libs/libunwind:=[lzma] )
		!lzma? ( sys-libs/libunwind:= )
	)
	xml? ( >=dev-libs/expat-1.1:= )"
DEPEND="${CDEPEND}
	test? ( dev-cpp/gtest )
	doc? (
		app-doc/doxygen
		media-gfx/graphviz
	)"
RDEPEND="${CDEPEND}"
BDEPEND=">=sys-devel/gcc-4.7.3
	>=dev-util/cmake-3.12
	virtual/pkgconfig"
DOCS="README.md"
PATCHES="${FILESDIR}/monero-0.16.0.3-unbundle-dependencies.patch"
CMAKE_USE_DIR="${S}/monero"

src_unpack() {
	unpack ${A}
	rm -r "${P}/haven-blockchain-explorer"
	mv "haven-blockchain-explorer-${BLOCKCHAIN_EXPLORER_COMMIT}" "${P}/haven-blockchain-explorer"
	mv monero-0.16.0.3 "${P}/monero"
}

src_prepare() {
	cmake_src_prepare

	# not necessary for monero-0.16.0.3
	rm patches/src/device_trezor/trezor/transport.cpp.patch

	einfo "Applying haven protocol patches to monero codebase."
	haven_dir="$PWD"
	cd patches
	find * -type f | while read line; do
		echo -n -e "\t"
		if [[ ${line: -6} == ".patch" ]]; then
			patchfile=$line
			dst="$haven_dir/monero/${patchfile//\.patch/}"
			patch -p0 $dst < $patchfile
		else
			dst="../monero/$line"
			dir=${line%/*}
			echo "Copying file $line to $dst ...";
			if [[ ! -d "../monero/$dir" ]]; then
				mkdir -p "../monero/$dir"
			fi
			cp $line $dst
		fi
	done
	cd ..
	sed -i -e "s/@HAVENTAG@/${PV}/g" monero/src/version.cpp.in
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DMANUAL_SUBMODULES=ON
		-DUSE_DEVICE_TREZOR=OFF
		-DBUILD_TESTS=$(usex test)
		-DBUILD_DOCUMENTATION=$(usex doc)
		-DUSE_READLINE=$(usex readline)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	rm -r ${D}/usr/include
	mv ${D}/usr/bin/monero-gen-ssl-cert ${D}/usr/bin/haven-gen-ssl-cert

	# OpenRC
	newinitd "${FILESDIR}/havend.openrc" havend
}

pkg_postinst() {
	elog "Create /etc/havend.conf"
}
