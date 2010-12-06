#!/bin/sh

# Include common variables and functions
source ./.common.sh

# Our default values
_XML="xml/.${BASEXML}"
_XSLT="${XSLTHTML}"
_OUT="${HTML}"


#export LC_ALL=C
TEMP=$(getopt -o h -l "help,xml:,xslt:,output:" -n "$0" -- "$@")
eval set -- "$TEMP"

while true
do
   case $1 in
    -h|--help)
      printf "${0#*/} [--xml XMLFILE] [--xslt STYLESHEET] [--output HTMLFILE] [PARAM=VALUE]*\n\n"
      printf "Transform an OWN XML file to a single XHTML.\n"
      exit 0
      ;;
    --xml)
      if [ ! -f "$2" ]; then
        error "XML file '$2' not found."
        exit 10
      fi
      _XML=$2
      shift
      ;;
    --xslt)
      if [ ! -f "$2" ]; then
        error "XSLT stylesheet '$2' not found."
        exit 20
      fi
      _XSLT=$2
      shift
      ;;
    --output)
      _OUT=$2
      shift
      ;;
    --) shift ; break ;;
    *)
      printf "Unknown option $1\n"
      exit 100
      ;;
   esac
   shift
done

debug "XML=$_XML, XSLT=$_XSLT, OUT=$_OUT"

validate
transform ${_XML} ${_XSLT} -o "${_OUT}" $@

# FIXME: How can be output an absolute path?
info "Find the XHTML file here: ${_OUT}"

cp xslt/xhtml/*.css ${HTMLDIR}
(cd ${HTMLDIR}
ln -sf ${XSLTDIR}/common .
)

