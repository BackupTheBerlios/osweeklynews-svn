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
XSLTFO=${XSLTDIR}/fo/docbook.xsl

validate
[ -d ${PDFDIR} ] || mkdir -p ${PDFDIR}

(cd ${PDFDIR}
ln -sf ../xslt/common .
)

transform xml/.${BASEXML} ${XSLTFO} -o "${FO}"
fop -c ${FOPCONF} ${FO} ${PDF}

