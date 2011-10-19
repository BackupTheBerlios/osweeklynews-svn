#!/bin/bash
# This Script makes a tag to ~/osweeklynews/tag/ownen$ISSUENUMBER
# As example if you want to make a tag to Issue 152 you have to start this Script like:
# $ ./maketag.sh 152
ISSUE=$1

# Check for empty issue:
if [ "$ISSUE" = "" ]; then
  echo "ERROR: Need an issue number for tagging."
  exit 10
fi

echo "Create a tag for Issue $ISSUE ..."

svn copy https://svn.code.sf.net/p/osweeklynews/code/trunk/en \
   https://svn.code.sf.net/p/osweeklynews/code/tags/ownen$ISSUE \
&& echo "Tag correct set."

