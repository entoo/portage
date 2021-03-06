# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-video-omap/xf86-video-omap-0.4.2.ebuild,v 1.3 2012/12/17 20:17:06 maekke Exp $

EAPI=4
XORG_DRI=always
inherit xorg-2

DESCRIPTION="OMAP video driver"

KEYWORDS="arm"

RDEPEND=">=x11-base/xorg-server-1.3
	>=x11-libs/libdrm-2.4.36[video_cards_omap]"
DEPEND="${RDEPEND}"
