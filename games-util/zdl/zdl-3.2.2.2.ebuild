# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit games qt4-r2

DESCRIPTION="An easy to use and flexible Doom Launcher"
HOMEPAGE="http://zdl.vectec.net"
SRC_URI="https://github.com/qbasicer/qzdl/archive/v3.2.2.2-stable.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	econf --disable-updater
}

src_install() {
	dogamesbin ${PN} || die "Couldn't install the binary! D:"
	newicon include/ico_icon.xpm ${PN}.xpm
	make_desktop_entry ${PN} "ZDL"
}


