# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-wavpack/gst-plugins-wavpack-0.10.31-r1.ebuild,v 1.5 2014/07/28 13:48:11 ago Exp $

EAPI="5"

GST_ORG_MODULE=gst-plugins-good
inherit gstreamer

DESCRIPTION="GStreamer encoder/decoder for wavpack audio format"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ppc ~ppc64 ~sparc x86 ~amd64-fbsd"
IUSE=""

RDEPEND=">=media-sound/wavpack-4.60.1-r1[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"