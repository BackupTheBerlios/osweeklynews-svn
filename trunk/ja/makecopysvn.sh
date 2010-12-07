#!/bin/bash
# (c) 2010 by Sascha Manns <saigkill@opensuse.org>
# This is a tool who copies the english svn content
# to a new place (like preparing for a new language).

# Usage: you have to run the Program:
# $ ./makecopysvn ru
# then he makes a copy for the russian language
# you have to use your local language ISO code instead of ru.

echo "Reading in the Language..."
LANG=$1
echo "...done"

echo "Copying the Files to the target..."
svn copy https://svn.berlios.de/svnroot/repos/osweeklynews/trunk/en \
https://svn.berlios.de/svnroot/repos/osweeklynews/trunk/$LANG
echo "...done"


