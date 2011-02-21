# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

EAPI=3

DESCRIPTION="Dr. Racket"
HOMEPAGE="http://racket-lang.org"
SRC_URI="http://download.racket-lang.org/installers/5.1/racket/racket-5.1-src-unix.tgz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="backtrace gtk"

RDEPEND="gtk? ( =x11-libs/gtk+-2*
			  x11-libs/libXrender
			  media-libs/freetype
			  media-libs/jpeg
			  media-libs/libpng
			  sys-libs/zlib )"

DEPEND="${RDEPEND}"


S="${WORKDIR}/racket-${PV%%_p*}/src"


src_configure(){
	econf
	emake || die
}

src_compile(){
	emake $(use_enable X gracket) \
			--enable-shared \
			--disable-perl \
			$(use_enable backtrace)
}

src_install() {
	cd "${S}/src"
    emake DESTDIR="${D}" install || die
    
    if use gtk; then
		newicon ../collects/icons/PLT-206.png drracket.png
		make_desktop_entry drracket "DrRacket" drracket "Development"
		elog "Racket 5.1 currently doesn't correctly play nice with libjpg versions over 6.2"
		elog "Please see http://groups.google.com/group/racket-users/browse_thread/thread/92b6b58f4b5b3f52/51c8530cbc165ac3?pli=1"
	fi

}