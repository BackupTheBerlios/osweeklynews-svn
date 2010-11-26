#!/bin/sh

# Include common variables and functions
source ./.common.sh

# The PDF output directory:
PDFDIR=pdf/
# The FO output filename:
FO=${PDFDIR}${BASEXML%.xml}.fo
# The PDF output filename
PDF=${PDFDIR}${BASEXML%.xml}.pdf
# The FOP configuration filename:
FOPCONF=fop-config.xml
# The XSLT stylesheet to create FO file:
XSLTFO=xslt/fo/docbook.xsl

validate
[ -d ${PDFDIR} ] || mkdir -p ${PDFDIR}
# HACK: This will change:
pushd ${PDFDIR}
ln -sf ../xslt/common .
popd

transform xml/.${BASEXML} ${XSLTFO} ${FO}
fop -c ${FOPCONF} ${FO} ${PDF}

