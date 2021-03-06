# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-v4l2/gst-plugins-v4l2-1.2.4-r1.ebuild,v 1.11 2014/09/15 08:22:59 ago Exp $

EAPI="5"

GST_ORG_MODULE=gst-plugins-good
inherit gstreamer

DESCRIPION="plugin to allow capture from video4linux2 devices"
KEYWORDS="alpha amd64 ~arm hppa ia64 ppc ppc64 sparc x86"
IUSE="udev"

RDEPEND="
	>=media-libs/libv4l-0.9.5[${MULTILIB_USEDEP}]
	>=media-libs/gst-plugins-base-1.2.3:1.0[X,${MULTILIB_USEDEP}]
	udev? ( >=virtual/libgudev-208:=[${MULTILIB_USEDEP}] )
"
DEPEND="${RDEPEND}
	virtual/os-headers"

GST_PLUGINS_BUILD="gst_v4l2"

multilib_src_configure() {
	gstreamer_multilib_src_configure \
		--with-libv4l2 \
		$(use_with udev gudev)
}
