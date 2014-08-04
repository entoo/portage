# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-mplex/gst-plugins-mplex-0.10.23-r1.ebuild,v 1.4 2014/07/23 15:21:49 ago Exp $

EAPI="5"

GST_ORG_MODULE=gst-plugins-bad
inherit gstreamer

DESCRIPTION="GStreamer plugin for MPEG/DVD/SVCD/VCD video/audio multiplexing"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc x86 ~amd64-fbsd"
IUSE=""

RDEPEND=">=media-video/mjpegtools-2.1.0-r1[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"