#!/bin/bash
# This Script makes a tag to ~/osweeklynews/tag/ownen$ISSUENUMBER
# As example if you want to make a tag to Issue 152 you have to start this Script like:
# $ ./maketag.sh 152
ISSUE=$1
echo "Create a tag for Issue $ISSUE ..."

svn copy http://svn.berlios.de/svnroot/repos/osweeklynews/trunk/en \
   http://svn.berlios.de/svnroot/repos/osweeklynews/tags/ownen$ISSUE

echo "Tag correct set."

