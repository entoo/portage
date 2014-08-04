# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/ant-jmf/ant-jmf-1.8.4.ebuild,v 1.5 2012/12/05 17:31:42 ago Exp $

EAPI="4"

# seems no need to dep on jmf-bin, the classes ant imports are in J2SE API since 1.3
ANT_TASK_DEPNAME=""

inherit ant-tasks

DESCRIPTION="Apache Ant's optional tasks for the Java Media Framework (JMF)."

KEYWORDS="amd64 ppc ppc64 x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE=""
