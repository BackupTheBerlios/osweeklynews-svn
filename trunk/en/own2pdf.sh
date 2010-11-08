#!/bin/sh

XML=xml/OWN.xml
FOPCONF=fop-config.xml
XSLTFO=xslt/fo/docbook.xsl

xmllint --nonet --valid --noout ${XML} || exit $!
xsltproc --output ${XML%.xml}.fo ${XSLTFO} ${XML} && fop -c ${FOPCONF} ${XML%.xml}.fo ${XML%.xml}.pdf

