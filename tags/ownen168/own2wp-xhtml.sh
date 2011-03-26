#!/bin/sh
#
#  This work is licensed under the
#  Creative Commons Attribution-ShareAlike 3.0 Unported License
#  by Sascha Manns. To view a copy of this license, visit
#  http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to
#  Creative Commons
#  171 Second Street
#  Suite 300
#  San Francisco California 94105
#  USA.

source ./.common.sh

# Where to save the Wordpress file:
WP=${HTMLDIR}/${BASEXML%.xml}-wp.html

./own2xhtml-single.sh --output ${WP} \
  logos.src.path=http://saigkill.homelinux.net/pub/OWN/common/logos/ $@


