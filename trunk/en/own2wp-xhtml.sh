#!/bin/sh
source ./.common.sh

# Where to save the Wordpress file:
WP=${HTMLDIR}/${BASEXML%.xml}-wp.html

./own2xhtml-single.sh --output ${WP} \
  logos.src.path=news.opensuse.org/wp-content/uploads/2010/12/ $@


