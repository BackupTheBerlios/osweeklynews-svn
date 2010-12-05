#!/bin/sh

# Include common variables and functions
source ./.common.sh

# The HTML output directory:
HTMLDIR=xhtml/
# The HTML output filename:
HTML=${HTMLDIR}${BASEXML%.xml}.html
# The XSLT stylesheet to create single HTML file:
XSLTHTML=${XSLTDIR}/xhtml/docbook.xsl

validate
transform xml/.${BASEXML} ${XSLTHTML} -o "${HTML}"
#
cp xslt/xhtml/*.css ${HTMLDIR}
(cd ${HTMLDIR}
ln -sf ${XSLTDIR}/common .
)

