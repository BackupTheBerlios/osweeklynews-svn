#!/bin/sh
# This document licensed under CC-BY-SA by Sascha Manns <saigkill@opensuse.org> and Thomas Schraitle <toms@suse.de>
#
#
# Include common variables and functions
source ./.common.sh

# Our default values
_XML="xml/.${BASEXML}"
_XSLT="${XSLTFO}"
_FO="${FO}"
_PDF="${PDF}"

#export LC_ALL=C
TEMP=$(getopt -o h -l "help,xml:,xslt:,pdf:fop-config:" -n "$0" -- "$@")
eval set -- "$TEMP"

while true
do
   case $1 in
    -h|--help)
      printf "${0#*/} [--xml XMLFILE] [--xslt STYLESHEET] [--pdf PDFFILE] [--fop-config FOPCONFIG] [PARAM=VALUE]*\n\n"
      printf "Transform an OWN XML file into PDF.\n"
      exit 0
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
    --) shift ; break ;;
    *)
      printf "Unknown option $1\n"
      exit 100
      ;;
   esac
   shift
done

debug "XML=$_XML, XSLT=$_XSLT, FO=$_FO, FOPCONF=$FOPCONF, PDF=$_PDF"

validate
[ -d ${PDFDIR} ] || mkdir -p ${PDFDIR}

(cd ${PDFDIR}
ln -sf ../xslt/common .
)

transform "${_XML}" "${_XSLT}" -o "${_FO}" $@
fop -c "${FOPCONF}" "${_FO}" "${_PDF}"

