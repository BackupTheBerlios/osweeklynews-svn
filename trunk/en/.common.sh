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

error() {
  echo -e "\033[31m[ERROR] $1\033[m\017"
}


info() {
  echo -e "\033[34m[Info] $1\033[m\017"
}

validate() {
 # validown.sh creates .OWN.xml file, could be used in following steps
 ./validown.sh || exit $!
 info "Validation successful."
}