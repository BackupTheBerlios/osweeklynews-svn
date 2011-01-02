#!/bin/sh
#
#  Common Entities for all OWN articles

#  This work is licensed under the
#  Creative Commons Attribution-ShareAlike 3.0 Unported License
#  by Sascha Manns. To view a copy of this license, visit
#  http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to
#  Creative Commons
#  171 Second Street
#  Suite 300
#  San Francisco California 94105
#  USA.

#
#
# Include common variables and functions
source ./.common.sh

# Our default values
_XML="xml/.${BASEXML}"
_XSLT="${XSLTFO}"
_FO="${FO}"
_PDF="${PDF}"
_FORMATTER=fop

#export LC_ALL=C
TEMP=$(getopt -o "hf:" -l "help,formatter:,xml:,xslt:,pdf:,xep-config:,fop-config:" -n "$0" -- "$@")
eval set -- "$TEMP"

usage()
{
  cat << EOF
${0#*/} [OPTIONS] [PARAM=VALUE]*

Transform an OWN XML file into PDF

Options:
  --xml XMLFILE       The XML file to use
  --xslt STYLESHEET   The stylesheet to use (must output XSL-FO)
  --pdf PDFFILE       Where to save the PDF file
  -f, --formatter FO  Which formatter to use (currently supported: fop, xep)
  --xep-config FILE   XEP configuration file
  --fop-config FILE   FOP configuration file
EOF
}

while true
do
   case $1 in
    -h|--help)
      usage
      exit 0
      ;;
    -f|--formatter)
      if [ "$2" = '' ]; then
        error "No formatter value."
        exit 20
      fi
      case $2 in
       xep)
        _FORMATTER=$2
         ;;
       XEP)
        _FORMATTER=xep
         ;;
       FOP|fop)
        # default, already set
        ;;
       *)
         error "Unsupported FO formatter '$2'"
         exit 100
       ;;
      esac
      shift
      ;;
    --xml)
      if [ ! -f "$2" ]; then
        error "XML file '$2' not found."
        exit 10
      fi
      _XML=$2
      _FO=${_XML%.xml}.fo
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
    --pdf)
      _PDF=$2
      shift
      ;;
    --fop-config)
      # Change our FOP config variable directly:
      FOPCONF=$2
      shift
      ;;
    --xep-config)
      XEPCONF=$2
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

debug "XML=$_XML, XSLT=$_XSLT, FO=$_FO, FOPCONF=$FOPCONF, PDF=$_PDF"

# Some other consistency checks

validate
[ -d ${PDFDIR} ] || mkdir -p ${PDFDIR}

(cd ${PDFDIR}
ln -sf ../xslt/common .
)

transform "${_XML}" "${_XSLT}" -o "${_FO}" $@

info "Using $_FORMATTER formatter..."
case $_FORMATTER in
  fop)
    fop -c "${FOPCONF}" "${_FO}" "${_PDF}"
    ;;
  xep)
    if [ "$XEPCONF" != "" ]; then
      export XEP_CONFIG_FILE=$XEPCONF
      info "Using XEP configuration file $XEPCONF"
    fi
    # export VERBOSE=1
    xep "${_FO}" "${_PDF}"
    ;;
esac

