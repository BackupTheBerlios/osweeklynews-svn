#!/bin/sh
#
# Contains definitions which are used by all transformation scripts
#

# The default main file:
XML=xml/OWN.xml
# Only the filename without path components:
BASEXML=${XML#*/}
# Used XSLT processor:
XSLT=${XSLT:-"xsltproc"}
# 

## Outputs error messages
error() {
  echo -e "\033[31m[ERROR] $1\033[m\017"
}


## Outputs information messages
info() {
  echo -e "\033[34m[Info] $1\033[m\017"
}


## Validates the XML file
validate() {
 # validown.sh creates .OWN.xml file, could be used in following steps
 ./validown.sh || exit $!
 info "Validation successful."
}


## Transforms XML file with XSLT stylesheet into an output format
transform() {
  # Parameters:
  # $1 = XML input file
  # $2 = XSLT stylesheet
  # $3 = optional output file
  if [ "$XSLT" = 'saxon' ]; then
 # The default saxon script supports catalogs, so there is no need to
 # add the -x, -y, and -t options. Default configuration file for XML
 # catalogs is /etc/java/resolver/CatalogManager.properties
 #
 # Uncomment the following line, if you want some debugging messages:
 # export VERBOSE=1
 OUTPUT=""
 if [ "$3" != '' ]; then
   OUTPUT="-o $3"
 fi
 saxon $OUTPUT $1 $2
elif [ "$XSLT" = 'xsltproc' ]; then
 OUTPUT=""
 if [ "$3" != '' ]; then
   OUTPUT="--output $3"
 fi
 xsltproc --xinclude $OUTPUT $2 $1

# We do not support Xalan at the moment, but only time will tell...
# elif [ "$XSLT" = 'xalan' ]; then
# ...
else
 error "ERROR: Unsupported XSLT processor $XSLT"
fi
}
