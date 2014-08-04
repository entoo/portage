# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/balloontip/balloontip-1.2.1.ebuild,v 1.1 2013/07/13 11:45:57 tomwij Exp $

EAPI="5"

JAVA_PKG_IUSE="doc examples source"

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="A balloon tip component to spice up your Java Swing applications."
HOMEPAGE="https://balloontip.java.net/"
SRC_URI="https://java.net/projects/${PN}/downloads/download/${PN}_${PV}.zip"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=virtual/jre-1.5"
DEPEND=">=virtual/jdk-1.5"

S="${WORKDIR}/${PN}_${PV}/src/${PN}"

java_prepare() {
	find . -name "*.jar" -delete || die

	cp "${FILESDIR}"/${P}-build.xml build.xml || die
}

src_install() {
	java-pkg_newjar target/${P}.jar

	dodoc "${WORKDIR}"/${PN}_${PV}/README.txt

	use doc && java-pkg_dojavadoc target/site/apidocs
	use examples && java-pkg_doexamples "${S}-examples"
	use source && java-pkg_dosrc src/main/java/*

}
