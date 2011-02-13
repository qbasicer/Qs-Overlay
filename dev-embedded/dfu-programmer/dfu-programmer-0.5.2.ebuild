# Copyright 2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A Device Firmware Update based USB programmer for Atmel chips"
HOMEPAGE="http://dfu-programmer.sourceforge.net"
SRC_URI="http://sourceforge.net/projects/dfu-programmer/files/dfu-programmer/${PV}/dfu-programmer-${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
}
