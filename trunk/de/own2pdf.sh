#!/bin/sh

# Include common variables and functions
source ./.common.sh

# The FO output filename:
FO=${BASEXML%.xml}.fo
# The PDF output filename
PDF=${BASEXML%.xml}.pdf
# The FOP configuration filename:
FOPCONF=fop-config.xml
# The XSLT stylesheet to create FO file:
XSLTFO=xslt/fo/docbook.xsl

validate
transform xml/.${BASEXML} ${XSLTFO} ${FO}
fop -c ${FOPCONF} ${FO} ${PDF}

