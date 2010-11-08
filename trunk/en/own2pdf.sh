#!/bin/sh

XML=xml/OWN.xml
BASEXML=${XML#*/}
FO=${BASEXML%.xml}.fo
PDF=${BASEXML%.xml}.pdf
FOPCONF=fop-config.xml
XSLTFO=xslt/fo/docbook.xsl

./validown.sh || exit $!
echo "Validation successful. Creating PDF..."
xsltproc --xinclude --output ${FO} ${XSLTFO} ${XML} && fop -c ${FOPCONF} ${FO} ${PDF}

