#!/bin/sh

# Include common variables and functions
source ./.common.sh

# The HTML output directory:
HTMLDIR=xhtml/
# The HTML output filename:
HTML=${HTMLDIR}${BASEXML%.xml}.html
HTMLNEU=${HTMLDIR}/OWNNEU.html
# The XSLT stylesheet to create single HTML file:
XSLTHTML=${XSLTDIR}/xhtml/docbook.xsl

validate
transform xml/.${BASEXML} ${XSLTHTML} -o "${HTML}"
echo "Stripping the Pathes for pictures"
sed 's/common\/logos/http:\/\/news.opensuse.org\/wp-content\/uploads\/2010\/12/g' ${HTML} > ${HTMLNEU} 
echo "done ..."
#
cp xslt/xhtml/*.css ${HTMLDIR}
(cd ${HTMLDIR}
ln -sf ${XSLTDIR}/common .
)

