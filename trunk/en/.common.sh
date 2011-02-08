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
# The default absolute XSLT stylesheet directory
XSLTDIR=$PWD/xslt/
# Default debugging value is no:
DEBUG=${DEBUG:-no}
# Get the current version from the entity file. Match the following
# line and extract the value of edition:
# <!ENTITY edition "...">
ENTITIES=xml/entities.ent
VER=$(cat $ENTITIES | sed -n 's#<!ENTITY\s\s*edition\s\s*"\(.*\)">#\1#p')


##
## HTML Parameters
##
# The HTML output directory:
HTMLDIR=xhtml/
# The single HTML output filename:
HTML=${HTMLDIR}${BASEXML%.xml}-${VER}.html
# The XSLT stylesheet to create single XHTML file:
XSLTHTML=${XSLTDIR}/xhtml/docbook.xsl

##
## FO Parameters
##
# The PDF output directory:
PDFDIR=pdf/
# The FO output filename:
FO=${PDFDIR}${BASEXML%.xml}.fo
# The PDF output filename
PDF=${PDFDIR}${BASEXML%.xml}-${VER}.pdf
# The FOP configuration filename:
FOPCONF=fop-config.xml
# The XEP configuration filename:
XEPCONF=xep-config.xml
# The XSLT stylesheet to create FO file:
XSLTFO=${XSLTDIR}/fo/docbook.xsl

##
## MediaWiki Parameters
##
# THe MediaWiki output directory:
WIKIDIR=wiki/
# The single MediaWiki output filename:
WIKI=${WIKIDIR}${BASEXML%.xml}-${VER}.wiki
# The XSLT stylesheet to create single MediaWiki file:
XSLTWIKI=${XSLTDIR}/db2mediawiki/docbook.xsl



## Outputs error messages
error() {
  echo -e "\033[31m[ERROR] $1\033[m\017"
}

## Outputs information messages
info() {
  echo -e "\033[34m[Info ] $1\033[m\017"
}

## Outputs debugging information when variable DEBUG=yes
debug() {
  [ "$DEBUG" = 'yes' ] && echo -e "\033[33m[Debug] $1\033[m\017"
}


## Validates the XML file
validate() {
 # validown.sh creates .OWN.xml file, could be used in following steps
 ./validown.sh || exit $!
 info "Validation successful."
}

## Transforms XML file with xsltproc
function transform_xsltproc()
{
  # Parameters:
  # $1 = XML input file
  # $2 = XSLT stylesheet
  # $3 = optional output file, needed -o FILE
  # $4 = option in the format PARAMETER=VALUE
  # $5 ... like $4
  xmlfile=$1
  xsltfile=$2
  shift 2
  output=""
  options=""

  if [ "$1" = "-o" -o "$1" = '--output' ]; then
     output="-o $2"
     shift 2
  fi
  # Iterate through all options and split them into
  # parameter and value
  while true
  do
     if [ "$1" = '' ]; then
        break
     fi
     param=${1%=*}
     value=${1#*=}
     options="$options --stringparam $param $value"
     shift
  done

  debug "xsltproc --xinclude $output $options $xsltfile $xmlfile"
  xsltproc --xinclude $output $options $xsltfile $xmlfile
}

## Transforms XML file with Saxon
function transform_saxon()
{
  # Parameters:
  # $1 = XML input file
  # $2 = XSLT stylesheet
  # $3 = optional output file, needed -o FILE
  # $4 = option in the format PARAMETER=VALUE
  # $5 ... like $4
  xmlfile=$1
  xsltfile=$2
  shift 2
  output=""

  if [ "$1" = "-o" -o "$1" = '--output' ]; then
     output="-o $2"
     shift 2
  fi

  options=$@
  debug "saxon $output $xmlfile $xsltfile  $options"
  saxon $output $xmlfile $xsltfile  $options
}

## Transforms XML file with XSLT stylesheet into an output format
transform() {
  # Parameters:
  # $1 = XML input file
  # $2 = XSLT stylesheet
  # $3 = optional output file, needed -o FILE
  # $4 = options

  if [ "$XSLT" = 'saxon'  ]; then
    transform_saxon $*
  elif [ "$XSLT" = 'xsltproc' ]; then
    transform_xsltproc $*
  else
    error "ERROR: Unsupported XSLT processor $XSLT"
  fi
  info "Transformation successful."
}
