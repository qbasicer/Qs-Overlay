# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Dr. Racket"
HOMEPAGE="http://racket-lang.org"
SRC_URI="http://download.racket-lang.org/installers/5.1/racket/racket-5.1-src-unix.tgz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gtk"

DEPEND=""
RDEPEND="${DEPEND}
	=x11-libs/gtk+-2*"

src_compile(){
	cd src/
	econf
	emake || die	
}

src_install() {
    emake DESTDIR="${D}" install || die
}