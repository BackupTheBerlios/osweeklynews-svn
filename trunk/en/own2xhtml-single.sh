#!/bin/sh

# Include common variables and functions
source .common.sh

# The FO output filename:
HTML=${BASEXML%.xml}.html
# The XSLT stylesheet to create single HTML file:
XSLTHTML=xslt/xhtml/docbook.xsl

validate
transform xml/.${BASEXML} ${XSLTHTML} ${HTML}
