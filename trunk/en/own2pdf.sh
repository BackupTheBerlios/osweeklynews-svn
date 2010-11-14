#!/bin/sh

# The main file:
XML=xml/OWN.xml
# Only the filename without path components:
BASEXML=${XML#*/}
# The FO output filename:
FO=${BASEXML%.xml}.fo
# The PDF output filename
PDF=${BASEXML%.xml}.pdf
# The FOP configuration filename:
FOPCONF=fop-config.xml
# The XSLT stylesheet to create FO file:
XSLTFO=xslt/fo/docbook.xsl
# Used XSLT processor:
XSLT=xsltproc

# validown.sh creates .OWN.xml file, could be used in following steps
./validown.sh || exit $!
echo "Validation successful. Creating PDF..."
echo "Using $XSLT..."

if [ "$XSLT" = 'saxon' ]; then
 # The default saxon script supports catalogs, so there is no need to
 # add the -x, -y, and -t options. Default configuration file for XML
 # catalogs is /etc/java/resolver/CatalogManager.properties
 # Uncomment the following line, if you want some debugging messages:
 # export VERBOSE=1
 saxon -o ${FO} xml/.${BASEXML} ${XSLTFO}
elif [ "$XSLT" = 'xsltproc' ]; then
 xsltproc --xinclude --output ${FO} ${XSLTFO} ${XML} && fop -c ${FOPCONF} ${FO} ${PDF}
# elif [ "$XSLT" = 'xalan' ]; then
# ...
else
 echo "ERROR: Unsupported XSLT processor $XSLT"
fi

