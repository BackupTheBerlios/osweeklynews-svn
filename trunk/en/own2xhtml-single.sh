#!/bin/sh

# Include common variables and functions
source ./.common.sh

# The HTML output directory:
HTMLDIR=xhtml/
# The HTML output filename:
HTML=${HTMLDIR}${BASEXML%.xml}.html
# The XSLT stylesheet to create single HTML file:
XSLTHTML=xslt/xhtml/docbook.xsl

validate
transform xml/.${BASEXML} ${XSLTHTML} ${HTML}
cp xslt/xhtml/*.css ${HTMLDIR}
