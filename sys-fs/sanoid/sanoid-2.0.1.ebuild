# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

SRC_URI="https://github.com/jimsalterjrs/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64"

DESCRIPTION="Policy-driven snapshot management and replication tools."
HOMEPAGE="https://github.com/jimsalterjrs/sanoid"

LICENSE="GPL-3"
SLOT="0"
IUSE="+pv +ssh +lzop +mbuffer"
DOCS="CHANGELIST LICENSE VERSION README.md"

RDEPEND="dev-lang/perl
		 dev-perl/Config-IniFiles
		 pv? ( sys-apps/pv )
		 ssh? ( virtual/ssh )
		 lzop? ( app-arch/lzop )
		 mbuffer? ( sys-block/mbuffer )"

src_install() {
	einstalldocs
	dobin sanoid syncoid findoid sleepymutex
	insinto /etc/sanoid
	doins sanoid.defaults.conf
	newins sanoid.conf sanoid.conf.example
}
